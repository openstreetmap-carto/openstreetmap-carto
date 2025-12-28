BEGIN {
	FS = "\t"
}

#! /bin/awk -f
{
	x = $1
	y = $2
	id = substr($3, 1, 1)
	orientation = substr($3, 2)
	rotation = 360 / 13 * (orientation - 1)
	if (rotation == 0) {
		printf("  <use xlink:href=\"#%s\" x=\"%.2f\" y=\"%.2f\"/>\n", id, x, y)
	} else {
		angle = -rotation * 3.1415926/180
		x_new = x * cos(angle) - y * sin(angle)
		y_new = x * sin(angle) + y * cos(angle)
		printf("  <use xlink:href=\"#%s\" x=\"%.2f\" y=\"%.2f\" transform=\"rotate(%.2f)\"/>\n", id, x_new, y_new, rotation)
	}
}
