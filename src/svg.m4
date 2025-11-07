# vim: syntax=pic

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
