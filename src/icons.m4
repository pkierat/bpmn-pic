# vim: syntax=pic

# Events

define icon_event_none {
}

define icon_event_message { # fg, bg, attr
  envelope(0.20, $1, $2, with .c at Here) 
}

define icon_event_timer { # fg, bg, attr
  [
    C: circle with .c at Here rad 0.125 $2
    line from C.c to (C.c + (0.07,0)) $1
    line from C.c to (C.c + (0,0.10)) $1
    poly(C.c, 12, 0.125)
    for i = 0 to n - 1 do {
      line from (x[i], y[i]) to ( (4*x[i]+cx)/5,(4*y[i]+cy)/5) $1
    }
  ] with .c at Here $3
}

define icon_event_signal { # fg, bg, attr
  [ triangle(0.13, $2) ] with .c at Here $3
}

define icon_event_multiple { # fg, bg, attr
  [ pentagon(0.13, $2) ] with .c at Here $3
}

define icon_event_conditional { # fg, bg, attr
  [
    B: box with .c at Here wid 0.14 ht 0.17 $1 $2
    line from (B.w.x + 0.02, (B.nw.y + B.w.y)/2) to (B.e.x - 0.02, (B.ne.y + B.e.y)/2) $1
    line from (B.w.x + 0.02, B.w.y)              to (B.e.x - 0.02, B.e.y) $1
    line from (B.w.x + 0.02, (B.sw.y + B.w.y)/2) to (B.e.x - 0.02, (B.se.y + B.e.y)/2) $1
  ] with .c at Here $3
}

define icon_event_link { # fg, bg, attr
  [ rarrow(0.03, $2) ] with .c at Here $3
}

define icon_event_escalation { # fg, bg, attr
  [
    circle with .c at Here radius 0.15 colored "white"
    P1: ( 0, 0.14)
    P2: (-0.1154, -0.066)
    P3: (0, 0)
    P4: (0.1154, -0.066)
    line from P1 to P2 then to P3 then to P4 then to P1 $2
  ] with .c at Here $3
}

define icon_event_error { # fg, bg, attr
  [
    r = 0.10*9/10
    P1: ( -r,    -r)
    P2: ( -r/2, 2*r/3)
    P3: (  r/2,   r/8)
    P4: (  r,     r)
    P5: (2*r/3,  -r/2)
    P6: ( -r/4,   r/8)
    line from P1 to P2 then to P3 then to P4 then to P5 then to P6 then to P1 $2
  ] with .c at Here $3
}

define icon_event_cancel { # fg, bg, attr
  [ cross(Here, 0.033, $2) ] with .c at Here
}

define icon_event_parallel { # fg, bg, attr
  [ plus($1 $2) ] with .c at Here $3
}

define icon_event_compensation { # fg, bg, attr
  [
    w = 0.2
    h = w/sqrt(3)
    P1: (-w/2,    0)
    P2: (   0,  h/2)
    P3: (   0, -h/2)
    P4: (   0,    0)
    P5: ( w/2,  h/2)
    P6: ( w/2, -h/2)
    line from P1 to P2 then to P3 then to P1 $2
    line from P4 to P5 then to P6 then to P4 $2
  ] with .c at Here $3
}

define icon_event_terminate { # fg, bg, attr
  [
    circle radius 0.10 $2
  ] with .c at Here $3
}

# Gateways

define icon_gateway_none {
}

define icon_gateway_exclusive { # fg, bg, attr
  [
    w = 0.18
    B: box width w height w colored "white"
    line from B.nw to B.se - (w/4, 0) \
              then to B.se \
              then to B.nw + (w/4, 0) \
              then to B.nw shaded "black"
    line from B.ne to B.sw + (w/4, 0) \
              then to B.sw \
              then to B.ne - (w/4, 0) \
              then to B.ne shaded "black"
  ] with .c at Here $3
}

define icon_gateway_parallel {
  plus(shaded "black")
}

define icon_gateway_inclusive {
  [
    circle rad 0.10 thick 2.5
  ] $3
}

define icon_gateway_complex { # fg, bg, attr
  [ 
    C: circle with .c at Here radius 0.10 colored "white"
    line from C.n  to C.s  thick 2
    line from C.w  to C.e  thick 2
    line from C.nw to C.se thick 2
    line from C.sw to C.ne thick 2
  ] $3
}

define icon_gateway_event_based {
  bpmn_event_start(multiple, , with .c at Here scaled 0.5)
}

define icon_gateway_event_based_exclusive {
  bpmn_event_catching(multiple, with .c at Here scaled 0.5)
}

define icon_gateway_event_based_parallel {
  bpmn_event_start(parallel, , with .c at Here scaled 0.5)
}

# Tasks

define icon_task_none {
}

define icon_task_receive {
    envelope(0.15, colored "black", shaded "white")
}

define icon_task_send {
    envelope(0.15, colored "white", shaded "black")
}

define icon_task_manual {
    hand(0.15, 0.1)
}

define icon_task_service {
    gear(0.075)
}

define icon_task_user {
    human(0.075)
}

define icon_task_script {
    scroll(0.075)
}

define icon_task_rule {
    table(0.075)
}

define icon_process_collapsed {
  [
    box width 0.15 height 0.15
    line from last box.n - (0, 0.02) to last box.s + (0, 0.02)
    line from last box.w + (0.02, 0) to last box.e - (0.02, 0)
  ] $1
}
