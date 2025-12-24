#!/usr/bin/env python3

# Colours for unpaved roads

# This reads some color variables from some .mss files and also reads
# symbols/unpaved/unpaved.svg and generates colourized versions of
# the unpaved pattern for all road types and saves them in the symbols/unpaved
# folder. Existing files of the same name are overwritten!
#
# This script produces patterns that perceptually have the same overall
# brightness as the original road color. Therefor, the pattern foreground
# is darker than the original color, and the pattern background lighter than
# the original color. This script does its very best, but the same overall
# brightness is not always possible (for example for white roads) and also
# depends on the monitor gammut on which the pattern is finally displayed.
#
# Usage: Call this script in the main directory of openstreetmap-carto
# without further parameters.
#
# Customize:
# You can customize this script by changing the first variables of in the main()
# function (color_names, file_names, darken, brighten_darken_ratio).

from colormath.color_objects import LabColor, sRGBColor
from colormath.color_conversions import convert_color

# def get_color_value_by_name(variable_name, file_names):
#
# Searches in MSS files for variable values with the given name. Returns
# the first value it finds. Only supports very basic syntax like:
# @test: 12; # Comment
# which would return "12".
#
# Paramaters:
# variable_name: the name of the variable for which we search the value
# file_names: list of files where we search for the variable value
#
# Return value: the variable value (if any)
def get_color_value_by_name(variable_name, file_names):
    for files in file_names:
        with open(files) as f:
            for line in f:
                if line.startswith("@" + variable_name + ":"):
                    temp = line.strip("@" + variable_name + ":").split(";")[0].strip()
                    # test if the value length is okay (#abc or #aabbcc)
                    if (len(temp) == 4) or (len(temp)== 7):
                        # remove the first character (#)
                        temp = temp[1:]
                        # expand value like #abc to #aabbcc
                        if len(temp) == 3:
                            temp = temp[0] + temp [0] + temp [1] + temp [1] + temp [2] + temp [2]
                        # make sure that the content is really a (lowercase) hex value
                        if all(c in set("0123456789abcdef") for c in temp):
                            # if so, return the hex value with a leading "#"
                            return ("#" + temp)

# Takes an RGB hex values, applies the indicated Lab lightness change and returns the result as RGB hex value again
# def change_lightness(base_color_rgb_hex, lightness_change):
#
# Changes the lightness of a given color. This function
# tries to do a perceptual transformation.
#
# Paramaters:
# base_color_rgb_hex: An RGB hex value like #1212ab
# lightness_change: A number (positive or negative), interpreted as change to the lightness component like in Lab perceptual color space (range: 0..100)
#
# Return value: The RGB hex value with the lightness change applied. If the lightness change leaves
# us with an out-of-gammut value, it is clipped to make sure to be within the RGB gammut. So the return
# value is guarantied to be always a valid RGB value.
def change_lightness(base_color_rgb_hex, lightness_change):
    base_color_lab = convert_color(sRGBColor.new_from_rgb_hex(base_color_rgb_hex), LabColor)
    new_color_lab = LabColor(
        base_color_lab.lab_l + lightness_change, # This value might be out of gammut and therefor invalid
        base_color_lab.lab_a,
        base_color_lab.lab_b,
        base_color_lab.observer,
        base_color_lab.illuminant)
    new_color_rgb = convert_color(new_color_lab, sRGBColor) # This value might be out of gammut and therefor invalid
    # use the "clamped" values which means they are within the gammut and therefor valid
    new_color_rgb_clamped = sRGBColor(
        new_color_rgb.clamped_rgb_r,
        new_color_rgb.clamped_rgb_g,
        new_color_rgb.clamped_rgb_b)
    return new_color_rgb_clamped.get_rgb_hex()

def main():

    # List of names of color variables in mss code for which we will generate patterns
    color_names = {
        'motorway-low-zoom',
        'trunk-low-zoom',
        'primary-low-zoom',
        'motorway-fill',
        'trunk-fill',
        'primary-fill',
        'secondary-fill',
        'platform-fill',
        'aeroway-fill',
        'road-fill',
        'pedestrian-fill',
        'living-street-fill',
        'raceway-fill',
        'residential-fill'
        }

    # List of names of mss files in which we search for color variables
    file_names = {
        'style/roads.mss',
        'style/road-colors-generated.mss'
        }

    # The value by which the original color is darkened for the pattern foreground
    # This value should always be negative.
    darken = -60

    # The pattern foreground occupies less space than the background. So lightening
    # the background has to be less intense than darkening the foreground. This
    # value is multiplied with the negative value of "darken" to get a value for
    # "brighten", so brighten_darken_ration must also be negative to make sure
    # the "brighten" result is positive. This value should (only) be changed when
    # the pattern itself is changed.
    brighten_darken_ratio = -0.065

    # actual code
    for color_name in color_names:
        print("\nColor name: " + color_name)
        original_color_value = get_color_value_by_name(color_name, file_names)
        print("Plain color: " + original_color_value)
        pattern_colors = [change_lightness(original_color_value, darken),
                          change_lightness(original_color_value, darken * brighten_darken_ratio)]
        print("Colors for pattern: " + str(pattern_colors))
        if pattern_colors:
            with open('symbols/unpaved/unpaved.svg', 'rt') as fin:
                with open('symbols/unpaved/unpaved_' + color_name + '.svg', 'wt') as fout:
                    for line in fin:
                        temp = line
                        temp = temp.replace('#0000ff', pattern_colors[0])
                        temp = temp.replace('fill:none', 'fill:' + pattern_colors[1])
                        fout.write(temp)
            print("Pattern file: " + 'symbols/unpaved/unpaved_' + color_name + '.svg')

if __name__ == "__main__":
    main()
