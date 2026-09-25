#!/usr/bin/env python3
"""Check clipping, repeat dimensions and transparent pattern casings.

Run from the repository root with python3 scripts/test_landcover_patterns.py.
Uses the same dependencies as generate_landcover_patterns.py.
"""

import tempfile
import unittest
from pathlib import Path
import xml.etree.ElementTree as ET

from shapely.geometry import Point, box
from svgpathtools import parse_path

import generate_landcover_patterns as patterns


class PatternTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)

    def source(self, body, size=16):
        filename = Path(self.directory.name) / 'source.svg'
        filename.write_text(
            '<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d">%s</svg>'
            % (size, size, body))
        return patterns.PatternSource(filename)

    def geometry(self, data):
        return patterns.path_to_geometry(parse_path(data))

    def test_clip_wrapped_symbol(self):
        source = self.source('<path d="M-2 4h4v4h-4z M14 4h4v4h-4z"/>')
        geometry = self.geometry(patterns.clipped_symbols_d(source, box(0, 0, 16, 16)))
        expected = box(0, 4, 2, 8).union(box(14, 4, 16, 8))
        self.assertAlmostEqual(geometry.symmetric_difference(expected).area, 0)

    def test_repeat_size_includes_empty_border(self):
        source = self.source('<path d="M4 4h2v2h-2z"/>')
        patterns.generate('fixture', dict(source='fixture', fill='#abcdef'),
                          {'fixture': source}, self.directory.name)
        root = ET.parse(Path(self.directory.name) / 'fixture.svg').getroot()
        self.assertEqual(root.get('viewBox'), '0 0 16 16')
        rect = root.find(patterns.SVG_NS + 'rect')
        self.assertEqual((rect.get('width'), rect.get('height')), ('16', '16'))
        self.assertEqual(rect.get('fill'), 'none')

    def test_rock_casing_is_transparent_and_respects_paint_order(self):
        source = self.source(
            '<defs><g id="base"><path d="M0 0h16v16h-16z"/></g>'
            '<g id="rock"><path d="M4 4h8v8h-8z" stroke="white" stroke-width="2"/></g></defs>'
            '<use href="#base"/><use href="#rock"/>')
        geometry = self.geometry(patterns.casing_flattened_d(source, box(0, 0, 16, 16)))
        self.assertTrue(geometry.contains(Point(2, 8)))
        self.assertFalse(geometry.contains(Point(3.5, 8)))
        self.assertTrue(geometry.contains(Point(4.5, 8)))
        # A later fill must cover an earlier casing.
        source.uses.reverse()
        geometry = self.geometry(patterns.casing_flattened_d(source, box(0, 0, 16, 16)))
        self.assertAlmostEqual(geometry.area, 256)

    def test_wetland_dashes_repeat_and_stay_pixel_aligned(self):
        source = self.source('<path d="M0 4h7v1h-7z"/>')
        mask = patterns.dash_mask(source, 32)
        self.assertEqual(int(mask.sum()), 28)
        for x, y in ((0, 4), (16, 4), (0, 20), (16, 20)):
            self.assertTrue(mask[y, x:x + 7].all())
        geometry = self.geometry(patterns.mask_d(mask))
        self.assertAlmostEqual(geometry.area, 28)
        self.assertTrue(all(value == round(value) for polygon in patterns.polygons(geometry)
                            for coordinate in polygon.exterior.coords for value in coordinate))


if __name__ == '__main__':
    unittest.main()
