divert(-1)
# Copyright (c) 2025 Pawel Kierat
# Licensed under the MIT License. See LICENSE file in the project root for details.

# vim: syntax=pic
divert

pi = 3.1415926535

define _poly { # center, sides, radius
  cx = $1.x
  cy = $1.y
  n = $2
  r = $3
  angle = 2*pi / n

  for i = 0 to n - 1 do {
    theta = i * angle
    x[i] = cx - r * sin(theta)
    y[i] = cy + r * cos(theta)
  }
  x[n] = x[0]
  y[n] = y[0]
}

define diamond { # radius, attr
  [
    line from Here + (0, $1) to Here + ($1,  0) \
                        then to Here + (0, -$1) \
                        then to Here + (-$1, 0) \
                        then to Here + (0,  $1) \
                        $2
  ]
}

define triangle { # radius, attributes
  [
    r = $1
    C: circle rad r with .c at Here invisible
    P1: ( 0, r)
    P2: ( r * sqrt(3)/2, -r/2)
    P3: (-r * sqrt(3)/2, -r/2)
    line from P1 to P2 then to P3 then to P1 $2
  ]
}

define pentagon { # radius, attributes
  [
    r = $1
    C: circle rad r with .c at Here invisible
    P1: (0, 1) * r
    P2: (-0.951,  0.309) * r
    P3: (-0.588, -0.809) * r
    P4: ( 0.588, -0.809) * r
    P5: ( 0.951,  0.309) * r
    line from P1 to P2 then to P3 then to P4 then to P5 then to P1 $2
  ]
}

define plus { # attributes
  [
    t = 0.033
    l = 3*t
    h = l/2

    line from (Here + (-t/2, -l)) to (Here + (t/2, -l)) \
                             then to (Here + (t/2, -t/2)) \
                             then to (Here + (l, -t/2)) \
                             then to (Here + (l, t/2)) \
                             then to (Here + (t/2, t/2)) \
                             then to (Here + (t/2, l)) \
                             then to (Here + (-t/2, l)) \
                             then to (Here + (-t/2, t/2)) \
                             then to (Here + (-l, t/2)) \
                             then to (Here + (-l, -t/2)) \
                             then to (Here + (-t/2, -t/2)) \
                             then to (Here + (-t/2, -l)) \
                             then to (Here + (-t/2, -l)) $1
  ]
}

define cross { # center, thickness, attributes
  [
    t = $2
    l = 3 * $2
    h = l / 2
    r = 0.707106 # sqrt(2) / 2

    line from    (r * (-t/2 + l  ), r * (-t/2 - l  )) + $1 \
              to (r * ( t/2 + l  ), r * ( t/2 - l  )) + $1 \
         then to (r * ( t/2 + t/2), r * ( t/2 - t/2)) + $1 \
         then to (r * ( l   + t/2), r * ( l   - t/2)) + $1 \
         then to (r * ( l   - t/2), r * ( l   + t/2)) + $1 \
         then to (r * ( t/2 - t/2), r * ( t/2 + t/2)) + $1 \
         then to (r * ( t/2 - l  ), r * ( t/2 + l  )) + $1 \
         then to (r * (-t/2 - l  ), r * (-t/2 + l  )) + $1 \
         then to (r * (-t/2 - t/2), r * (-t/2 + t/2)) + $1 \
         then to (r * (-l   - t/2), r * (-l   + t/2)) + $1 \
         then to (r * (-l   + t/2), r * (-l   - t/2)) + $1 \
         then to (r * (-t/2 + t/2), r * (-t/2 - t/2)) + $1 \
         then to (r * (-t/2 + l  ), r * (-t/2 - l  )) + $1 $3
  ]
}

define rarrow { # thickness, attr
  [
    t = 2 * $1
    l = 3 * t
    h = l / 2

    line from    (-t/2, t/2) to (-l, t/2) \
         then to (-l, -t/2) \
         then to (-t/2, -t/2) \
         then to (-t/2, -t) \
         then to (t/2, 0) \
         then to (-t/2, t) \
         then to (-t/2, t/2) $2
  ]
}

define envelope { # width, foreground, background, attr
  [
    B: box with .c at Here width $1 height (2*$1/3) $2 $3
    line from B.nw to B.c then to B.ne $2
  ] $4
}

define hand {# wid, ht
  [
    w = $1
    h = 2*w/3
    B: box wid w ht h with .c at Here invisible
    line from B.sw to (B.nw - (0, 0.05))
    arc cw from (B.nw - (0, 0.05)) to (B.nw + (0.05, 0)) with .c at (B.nw + (0.05, -0.05))
    line to B.n; arc cw from B.n to B.n - (0, h/5) with .c at (B.n - (0, h/10))
    line to B.nw + (w/4,  -h/5)
    line to B.ne - (w/5,   h/5); arc cw to B.ne - (w/5, 2*h/5) with .c at (B.ne - (w/5, 3*h/10))
    line to B.n  - (  0, 2*h/5)
    line to B.ne - (w/7, 2*h/5); arc cw to B.ne - (w/7, 3*h/5) with .c at (B.ne - (w/7, 5*h/10))
    line to B.n  - (  0, 3*h/5)
    line to B.ne - (w/5, 3*h/5); arc cw to B.ne - (w/5, 4*h/5) with .c at (B.ne - (w/5, 7*h/10))
    line to B.n  - (  0, 4*h/5)
    line to B.ne - (w/3, 4*h/5); arc cw to B.ne - (w/3, 5*h/5) with .c at (B.ne - (w/3, 9*h/10))
    line to B.sw
  ]
}

define gear { # radius
  [
    r = $1/1.5
    C: circle rad r/2 with .c at Here
    _poly(C.c, 16, r)
    line from x[0], y[0] to x[0], y[0]
    for i = 0 to n - 1 by 2 do {
      dx = x[i+1] - x[i] ; dy = y[i+1] - y[i]
      dx1 = -dy; dy1 = dx
      P1 : (x[i], y[i]) - (dx1, dy1)
      P2 : P1 + (dx, dy)
      continue to P1 then to P2 then to (x[i+1], y[i+1]) then to (x[i+2], y[i+2])
    }
  ]
}

define human { # radius
  [
    r = $1
    C: circle rad r/2 with .c at Here
    arc cw from C.s - (r, r) to C.s + (r, -r) at C.s + (0, -r)
  ]
}

define scroll { # radius
  [
    B: box wid 4*$1/3 ht 2*$1 with .c at Here invisible
    line from B.nw to B.ne
    arc cw at (B.e.x -0.05, (B.e.y + B.ne.y)/2) to B.e
    arc ccw at (B.e.x +0.05, (B.e.y + B.se.y)/2) to B.se
    line to B.sw
    arc cw at (B.w.x +0.05, (B.w.y + B.sw.y)/2) to B.w
    arc ccw at (B.w.x -0.05, (B.w.y + B.nw.y)/2) to B.nw
    line from (1/2 <B.nw, B.w>) + (0.03, 0) to (1/2 <B.ne, B.e>) - (0.01, 0)
    line from B.w + (0.02, 0) to B.e - (0.02, 0)
    line from (1/2 <B.sw, B.w>) + (0.01, 0) to (1/2 <B.se, B.e>) - (0.03, 0)
  ]
}

define table { # radius
  [
    r = $1
    B: box wid 2*r ht 2*r with .c at Here
    line from B.w + (  0,  r/3) to B.e + (   0,  r/3)
    line from B.w + (  0, -r/3) to B.e + (   0, -r/3)
    line from B.w + (r/2,  r/3) to B.sw + (r/2,    0)
  ]
}

define rewind { # width
  [
    w = $1
    h = w/sqrt(3)
    B: box width w height w with .c at (0, 0) invisible
    P1: (-w/2,    0) - (0.03, 0)
    P2: (   0,  h/2) - (0.03, 0)
    P3: (   0, -h/2) - (0.03, 0)
    P4: (   0,    0) - (0.03, 0)
    P5: ( w/2,  h/2) - (0.03, 0)
    P6: ( w/2, -h/2) - (0.03, 0)
    line from P1 to P2 then to P3 then to P1 $2
    line from P4 to P5 then to P6 then to P4 $2
  ]
}

define tilde { # width
  [
    B: box wid $1 ht $1  with .c at Here invisible
    arc cw at ((B.sw.x + B.s.x)/2, B.s.y + 0.05) from B.w to B.c thick 2
    arc ccw at ((B.s.x + B.se.x)/2, B.n.y - 0.05) from B.c to B.e thick 2
  ]
}

define clock {
  [
    C: circle with .c at Here rad 0.125 $2
    line from C.c to (C.c + (0.07,0)) $1
    line from C.c to (C.c + (0,0.10)) $1
    _poly(C.c, 12, 0.125)
    for i = 0 to n - 1 do {
      line from (x[i], y[i]) to ( (4*x[i]+cx)/5,(4*y[i]+cy)/5) $1
    }
  ]
}
