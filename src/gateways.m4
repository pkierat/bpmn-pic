# vim: syntax=pic

define bpmn_gateway {
  [
    B: diamond(0.2)
    if ($+ >= 1) then {
      move to B.c
      exec "icon_gateway_$1( , , with .c at Here)"
    }
  ] $2
}

define bpmn_gateway_none {
  bpmn_gateway(none, $1)
}


define bpmn_gateway_exclusive {
  bpmn_gateway(exclusive, $1)
}

define bpmn_gateway_parallel {
  bpmn_gateway(parallel, $1)
}

define bpmn_gateway_inclusive {
  bpmn_gateway(inclusive, $1)
}

define bpmn_gateway_complex {
  bpmn_gateway(complex, $1)
}

define bpmn_gateway_event_based {
  bpmn_gateway(event_based)
}

define bpmn_gateway_event_based_exclusive {
  bpmn_gateway(event_based_exclusive)
}

define bpmn_gateway_event_based_parallel {
  bpmn_gateway(event_based_parallel)
}

