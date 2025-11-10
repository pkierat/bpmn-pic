divert(-1)
# Copyright (c) 2025 Pawel Kierat
# Licensed under the MIT License. See LICENSE file in the project root for details.

# vim: syntax=pic
divert

define bpmn_event_start { # type, [ line style, [ attributes ] ]
  [
    circle rad 0.2 $2
    move to last circle.c
    exec "icon_event_$1(colored \"black\", shaded \"white\")"
  ] $3
}

define bpmn_event_start_interrupting {
    bpmn_event_start($1, solid)
}

define bpmn_event_start_non_interrupting {
    bpmn_event_start($1, dashed, $2)
}

define bpmn_event_intermediate { # type, line style, foreground, background, attributes
  [
    circle rad 0.2 $2
    circle rad 0.16 at last circle.c $2
    move to last circle.c
    exec "icon_event_$1($3, $4)"
  ] $5
}

define bpmn_event_catching { # type [, attributes ]
    bpmn_event_intermediate($1, solid, colored "black", shaded "white", $2)
}

define bpmn_event_boundary { # type [, attributes ]
    bpmn_event_intermediate($1, solid, colored "black", shaded "white", $2)
}

define bpmn_event_boundary_non_interrupting { # type, attr
    bpmn_event_intermediate($1, dashed, colored "black", shaded "white", $2)
}

define bpmn_event_throwing { # type, attr
    bpmn_event_intermediate($1, solid, colored "white", shaded "black", $2)
}

define bpmn_event_end {
  [
    circle rad 0.17 thick 2.5 $2
    move to last circle.c
    exec "icon_event_$1(color \"white\", shaded \"black\")"
  ]
}

