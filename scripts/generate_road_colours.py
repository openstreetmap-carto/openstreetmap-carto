#!/usr/bin/env python3

# Generates a set of highway colors to be stored in road-colors-generated.mss.

from colormath.color_conversions import convert_color
from colormath.color_objects import LabColor, LCHabColor, sRGBColor
from colormath.color_diff import delta_e_cie2000
import argparse
import sys
import yaml

from collections import OrderedDict, namedtuple

class Color:
    """A color in the CIE lch color space."""

    def __init__(self, lch_tuple):
        self.m_lch = LCHabColor(*lch_tuple)

    def lch(self):
        return "Lch({:.0f},{:.0f},{:.0f})".format(*(self.m_lch.get_value_tuple()))

    def rgb(self):
        rgb = convert_color(self.m_lch, sRGBColor)
        if (rgb.rgb_r != rgb.clamped_rgb_r or rgb.rgb_g != rgb.clamped_rgb_g or rgb.rgb_b != rgb.clamped_rgb_b):
            raise Exception("Colour {} is outside sRGB".format(self.lch()))
        return rgb.get_rgb_hex()

    def rgb_error(self):
        return delta_e_cie2000(convert_color(self.m_lch, LabColor),
                               convert_color(sRGBColor.new_from_rgb_hex(self.rgb()), LabColor))

def load_settings():
    """Read the settings from YAML."""
    return yaml.safe_load(open('road-colors.yaml', 'r'))

def generate_colours(settings, section):
    """Generate colour ranges.

    Arguments:
    settings -- The settings loaded by load_settings.
    section -- Which section of the settings under 'classes' to use. Typically
               'mss' or 'shields'.
    """
    road_classes = settings['roads']
    colour_divisions = len(road_classes) - 1
    hues = OrderedDict()

    min_h = settings['hue'][0]
    max_h = settings['hue'][1]

    delta_h = (max_h - min_h) / colour_divisions

    h = min_h
    for name in road_classes:
        hues[name] = h
        h = (h + delta_h) % 360

    # A class to hold information for each line
    ColourInfo = namedtuple("ColourInfo", ["start_l", "end_l", "start_c", "end_c"])

    line_colour_infos = OrderedDict()

    # The lightness (l) and chroma (c; also known as saturation) for each type of colour.
    # Lightness ranges from 0 to 100; dark to bright.
    # Chroma ranges from 0 to 100 too; unsaturated to fully saturated.

    # The higher the road classification, the higher its saturation. Conversely,
    # the roads get brighter towards the lower end of the classification.

    classes = settings['classes'][section]
    for cls, params in sorted(classes.items()):
        l = params['lightness']
        c = params['chroma']
        line_colour_infos[cls] = ColourInfo(start_l = l[0], end_l = l[1], start_c = c[0], end_c = c[1])

    # Colours for the MSS
    colours = OrderedDict()

    for line_name, line_colour_info in line_colour_infos.items():
        c = line_colour_info.start_c
        delta_c = (line_colour_info.end_c - line_colour_info.start_c) / colour_divisions
        l = line_colour_info.start_l
        delta_l = (line_colour_info.end_l - line_colour_info.start_l) / colour_divisions

        colours[line_name] = OrderedDict()
        for name in road_classes:
            colours[line_name][name] = Color((l, c, hues[name]))
            c += delta_c
            l += delta_l

    return colours

def main():
    parser = argparse.ArgumentParser(description='Generates road colours')
    parser.add_argument('-v', '--verbose', dest='verbose', help='Generates information about colour differences', action='store_true', default=False)
    args = parser.parse_args()

    settings = load_settings()
    road_classes = settings['roads']
    colour_divisions = len(road_classes) - 1
    colours = generate_colours(settings, 'mss')

    # Print a warning about the nature of these definitions.
    print("/* This is generated code, do not change this file manually.          */")
    print("/*                                                                    */")
    print("/* To change these definitions, alter road-colors.yaml and run:       */")
    print("/*                                                                    */")
    print("/* scripts/generate_road_colours.py > style/road-colors-generated.mss */")
    print("/*                                                                    */")

    for line_name, line_colours in colours.items():
        for name, colour in line_colours.items():
            if args.verbose:
                line = "@{name}-{line_name}: {rgb}; // {lch}, error {delta:.1f}"
            else:
                line = "@{name}-{line_name}: {rgb};"
            print((line.format(name = name, line_name=line_name, rgb = colour.rgb(), lch = colour.lch(), delta = colour.rgb_error())))

if __name__ == "__main__":
    main()
