divert(-1)
# Copyright (c) 2025 Pawel Kierat
# Licensed under the MIT License. See LICENSE file in the project root for details.

# vim: syntax=pic
divert

define Diagram { # width [, title ]
    box width $1 height 0 with .nw at (0, 0) invisible 
    move to last box.n
    $2
}

define Start { # type [, attributes ]
    bpmn_event_start($1, solid, $2)
}

define StartNonInterrupting {
    bpmn_event_start_non_interrupting($1, $2)
}

define Boundary {
    bpmn_event_boundary($1, $2)
}

define BoundaryNonInterrupting {
    bpmn_event_boundary_non_interrupting($1, $2)
}

define Catching {
    bpmn_event_catching($1, $2)
}

define Throwing {
    bpmn_event_throwing($1, $2)
}

define End {
    bpmn_event_end($1, $2)
}

define Gateway {
    bpmn_gateway($1, $2)
}

define Task {
    bpmn_task($1, $2, $3)
}

define SubProcess {
    bpmn_process_collapsed($1, $2, $3, $4, $5, $6, $7, $8, $9)
}

define SubProcessExpanded { # width, # height, markers ...
    bpmn_process_expanded($1, $2, $3, $4, $5, $6, $7, $8, $9)
}


define SequenceFlow {
    bpmn_sequence_flow($1, $2, $3, $4, $5, $6, $7, $8, $9)
}

define ConditionalFlow {
    bpmn_sequence_flow_conditional($1, $2, $3, $4, $5, $6, $7, $8, $9)
}

define DefaultFlow {
    bpmn_sequence_flow_default($1, $2, $3, $4, $5, $6, $7, $8, $9)
}

define MessageFlow {
    bpmn_message_flow($1, $2, $3, $4, $5, $6, $7, $8, $9)
}

define Pool {
    bpmn_pool($1, $2, $3, $4)
}

define VerticalPool {
    bpmn_vertical_pool($1, $2, $3, $4)
}

define BlackBoxPool {
    bpmn_black_box_pool($1, $2, $3)
}

define Lane {
    bpmn_lane($1, $2, $3)
}

define Text { # text, position, rotation
    if ("$2" == "") then {
        svg_rotated_text($1, Here, 0)
    } else {
        svg_rotated_text($1, $2, $3)
    }
}

