divert(-1)
# Copyright (c) 2025 Pawel Kierat
# Licensed under the MIT License. See LICENSE file in the project root for details.

# vim: syntax=pic
divert

define bpmn_pool { # width, height, lanes, attributes
    [
        _width  = $1
        _height = $2

        box width _width height _height
        if (_width > _height) then {
            Label: box width 0.25 height _height with .w at last box.w
            Content: box width _width - Label.width height _height invisible with .w at Label.e
        } else {
            Label: box width _width height 0.25 with .n at last box.n
            Content: box width _width height _height - 0.25 invisible with .n at Label.s
        }
        Lanes: $3 with .nw at Content.nw
    ] $4
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

define bpmn_vertical_pool { # width, height, lanes, attributes
    [
        _width  = $1
        _height = $2

        box width _width height _height
        Label: box width _width height 0.25 with .n at last box.n
        Content: box width _width height _height - 0.25 invisible with .n at Label.s
        Lanes: $3 with .nw at Content.nw
    ] $4
}

define bpmn_black_box_pool { # width, height, attributes
    box width $1 height $2 $3
}

define bpmn_lane { # thickness, content, attributes
    [
        _thickness = $1

        if (Content.width > Content.height) then {
            Label: box width 0.25 height _thickness invisible
            Content: box width Content.width height _thickness with .w at Label.w
        } else {
            Label: box width _thickness height 0.25 invisible
            Content: box width _thickness height Content.height with .n at Label.n
        }
        Process: $2
    ] $3
}

define bpmn_horizontal_lane { # thickness, content, attributes
    [
        _thickness = $1

        Label: box width 0.25 height _thickness invisible
        Content: box width Content.width height _thickness with .w at Label.w
        Process: $2
    ] $3
}

define bpmn_vertical_lane { # thickness, content, attributes
    [
        _thickness = $1

        Label: box width _thickness height 0.25 invisible
        Content: box width _thickness height Content.height with .n at Label.n
        Process: $2
    ] $3
}
