# vim: syntax=pic

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
    bpmn_process($1, $2, $3)
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

define HorizontalPool {
    bpmn_horizontal_pool($1, $2, $3, $4) 
}

define HorizontalBlackBoxPool {
    bpmn_horizontal_pool_black_box($1, $2, $3, $4)
}

define HorizontalLane {
   bpmn_horizontal_lane($1, $2)
}

define Pool {
    HorizontalPool($1, $2, $3)
}

define Lane {
    HorizontalLane($1, $2)
}

define Text { # text, position, rotation
    if ("$2" == "") then {
        svg_rotated_text($1, Here, 0)
    } else {
        svg_rotated_text($1, $2, $3)
    }
}

