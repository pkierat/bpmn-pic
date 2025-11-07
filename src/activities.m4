# vim: syntax=pic

define bpmn_activity {
  box wid 1 ht 0.75 rad 0.02 $1
}

define bpmn_task {
  [
    B: bpmn_activity($1)
    if ("$2" != "") then {
      move to B.nw + (0.05, -0.1)
      exec "icon_task_$2"
    }
  ] $3
}

define bpmn_task_none {
  bpmn_task($1, none, $2)
}

define bpmn_task_receive {
  bpmn_task($1, receive, $2)
}

define bpmn_task_send {
  bpmn_task($1, send, $2)
}

define bpmn_task_manual {
  bpmn_task($1, manual, $2)
}

define bpmn_task_service {
  bpmn_task($1, service, $2)
}

define bpmn_task_user {
  bpmn_task($1, user, $2)
}

define bpmn_task_script {
  bpmn_task($1, script, $2)
}

define bpmn_task_rule {
  bpmn_task($1, rule, $2)
}

define bpmn_process {
  [
    B: bpmn_activity($1)
    if ($+ >= 2) then {
      exec "icon_process_$2(with .s at B.s)"
    }
  ] $3
}

define bpmn_process_collapsed {
    bpmn_process($1, collapsed)
}

define bpmn_process_expanded {
  box wid $1 ht $2 rad 0.02 $3
}
