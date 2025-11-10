divert(-1)
# Copyright (c) 2025 Pawel Kierat
# Licensed under the MIT License. See LICENSE file in the project root for details.

# vim: syntax=pic
divert

level = 0
abs_x[level] = Here.x
abs_y[level] = Here.y

define push_abs_xy {
    level += 1
    abs_x[level] = Here.x + abs_x[level-1]
    abs_y[level] = Here.y + abs_y[level-1]
}

define pop_abs_xy {
    abs_x[level] = 0
    abs_y[level] = 0
    level -= 1
}

define with_abs_xy {
    push_abs_xy
    $1
    pop_abs_xy
}

define abs_xy {
    $1 + (abs_x[level], abs_y[level])
}

define svg_rotated_text { # text, position, degrees
    Abs: abs_xy($2)
    R: (Abs.x, -(Abs.y)) * dpPPI

    rotation = 0 ; if ("$3" != "") then { rotation = $3 }

    command sprintf("<g transform=\"rotate(%g, %g, %g)\">", rotation, R.x, R.y)
    command sprintf("<text font-size=\"11pt\"
                           text-anchor=\"middle\"
                           stroke-width=\"0.266667\"
                           fill=\"black\"
                           x=\"%g\" y=\"%g\">", R.x, R.y)
    command $1
    command "</text>"
    command "</g>"
}
