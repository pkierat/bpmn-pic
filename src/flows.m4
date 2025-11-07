# vim: syntax=pic

define bpmn_sequence_flow { # $1, $2, ... - line segments
    _bpmn_flow([], solid, shaded "black", $1, $2, $3, $4, $5, $6, $7, $8, $9)
}

define bpmn_sequence_flow_default {
    _bpmn_flow([ _bpmn_flow_start_slash(eta) ] with .Tip at (x[0], y[0]), solid, shaded "black", $1, $2, $3, $4, $5, $6, $7, $8, $9)
}

define bpmn_sequence_flow_conditional {
    _bpmn_flow([ _bpmn_flow_start_diamond(eta, shaded "white") ] with .Tip at (x[0], y[0]), solid, shaded "black", $1, $2, $3, $4, $5, $6, $7, $8, $9)
}

define bpmn_message_flow {
    _bpmn_flow([ _bpmn_flow_start_circle ] with .c at (x[0], y[0]), dashed, shaded "white", $1, $2, $3, $4, $5, $6, $7, $8, $9)
}


define _bpmn_flow_start_diamond { # rotation, style
    Tip: (0, 0)
    P2:  (0.08*cos($1) - 0.04*sin($1), 0.08*sin($1) + 0.04*cos($1))
    P3:  (0.16*cos($1) - 0.00*sin($1), 0.16*sin($1) + 0.00*cos($1))
    P4:  (0.08*cos($1) + 0.04*sin($1), 0.08*sin($1) - 0.04*cos($1))
    line shaded "white" from Tip to P2 then to P3 then to P4 then to Tip
}

define _bpmn_flow_start_slash { # rotation, style
    Tip: (-0.08*cos($1) - 0.00*sin($1), -0.08*sin($1) + 0.00*cos($1))
    P2:  ( 0.08*cos($1) - 0.00*sin($1),  0.08*sin($1) + 0.00*cos($1))
    P3:  (-0.04*cos($1) - 0.04*sin($1), -0.04*sin($1) + 0.04*cos($1))
    P4:  ( 0.04*cos($1) + 0.04*sin($1),  0.04*sin($1) - 0.04*cos($1))
    line from Tip to P2
    line from P3  to P4
}

define _bpmn_flow_start_circle {
    circle rad 0.025 shaded "white"
}

define _bpmn_arrowhead { # rotation, style
    P1:  ( 0.025*sin($1), -0.025*cos($1))
    P2:  (-0.025*sin($1),  0.025*cos($1))
    Tip: ( 0.075*cos($1),  0.075*sin($1))
    P4:  ( 0.025*sin($1), -0.025*cos($1))
    line from P1 to P2 then to Tip then to P4 $2
}

define _bpmn_flow { # start, line style, arrowhead style, n
                    # $5, $6, ... - line segments
    line $2 $4

    x[0] = last line.start.x ; y[0] = last line.start.y
    x[1] = last line.end.x   ; y[1] = last line.end.y

    n = 1

    for i = 5 to $+ do {
        exec sprintf(                             \
            "if (\"$%g\" != \"\") then { "      + \
                "continue $%g ; "               + \
                "x[i-3] = last line.end.x ; "   + \
                "y[i-3] = last line.end.y ; "   + \
                "n += 1 ; "                     + \
            "}", i, i                             \
        )
    }

    sdx = x[1] - x[0]; sdy = y[1] - y[0]
    eta = atan2(sdy, sdx)
    
    edx = x[n] - x[n-1]; edy = y[n] - y[n-1]
    theta = atan2(edy, edx)
    
    $1

    [ _bpmn_arrowhead(theta, $3) ] with .Tip at (x[n], y[n])
}

