#set page(height:auto, width: 16cm, margin: 1em)
#import "@preview/abbr:0.2.2"

#abbr.list()
#abbr.make(
  ("PDE", "Partial Differential Equation"),
  ("BC", "Boundary Condition"),
  ("DOF", "Degree of Freedom", "Degrees of Freedom"),
)

= Constrained Equations

#abbr.pla[BC] constrain the #abbr.pla[DOF] of the #abbr.pla[PDE] they act on.

#abbr.config(style: it => text(red, it), space-char: sym.arrow.l.r)

#abbr.pla[BC] constrain the #abbr.pla[DOF] of the #abbr.pla[PDE] they act on.

#abbr.add("MOL", "Method of Lines")
The #abbr.a[MOL] is a procedure to solve #abbr.pla[PDE] in time.
