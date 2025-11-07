# vim: syntax=pic

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

define bpmn_horizontal_pool { # width, height, lanes, attributes
    [
        _width  = $1
        _height = $2

        box width _width height _height
        Label: box width 0.25 height _height with .w at last box.w
        Content: box width _width - Label.width height _height invisible with .w at Label.e
        Lanes: $3 with .nw at Content.nw
    ] $4
}

define bpmn_horizontal_pool_black_box { # width, height, text, attributes
    box width $1 height $2 $3 $4
}

define bpmn_horizontal_lane { # height, content, attributes
    [
        _height = $1
        
        Label: box width 0.25 height _height invisible
        Content: box width Content.width height _height with .w at Label.w
        Process: $2
    ] $3
}
