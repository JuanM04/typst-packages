// a minimal example, also listed in the README

#import "@preview/glossy:0.1.1": *

#let myGlossary = (
    (key: "html", short: "HTML", long: "Hypertext Markup Language", description: "A standard language for creating web pages", group: "Web"),
    (key: "css", short: "CSS", long: "Cascading Style Sheets", description: "A language used for describing the presentation of a document", group: "Web"),
    (key: "tps", short: "TPS", long: "test procedure specification"),
    // Add more entries as needed
)

#show: init-glossary.with(myGlossary)

#set heading(numbering: "1.1")

= Hello, `glossy`!

In modern web development, languages like @html and @css are essential.

Now make sure I get your @tps:short reports by 2pm!

= Examples with modifiers

#table(
  columns: 2,
  table.header([*Input*], [*Output*]),

[`@tps:short`      ], [@tps:short],
[`@tps:long`       ], [@tps:long],
[`@tps:both`       ], [@tps:both],
[`@tps:long:cap`   ], [@tps:long:cap],
[`@tps:long:pl`    ], [@tps:long:pl],
[`@tps:short:pl`   ], [@tps:short:pl],
[`@tps:both:pl:cap`], [@tps:both:pl:cap],
)

== Using conflicting modifiers (short, long, both)

These modifiers are semantically mutually exclusive, by they can be combined
syntactically. When multiple are used, `glossy` tries to make a smart choice on
which one to display.

#table(
  columns: 2,
  table.header([*Input*], [*Output*]),

[`@tps:short:long`      ], [@tps:short:long],
[`@tps:long:short`      ], [@tps:long:short],
[`@tps:short:both`       ], [@tps:short:both],
[`@tps:long:both`       ], [@tps:long:both],
[`@tps:short:long:both`   ], [@tps:short:long:both],
[`@tps:long:pl`    ], [@tps:long:pl],
)

#let my-theme = (
  section: (title, body) => {
    heading(level: 1, title)
    body
  },
  group: (name, i, n, body) => {
    if name != "" and n > 1 {
      heading(level: 2, name)
    }
    body
  },
  entry: (entry, i, n) => {
    // i is the entry's index, n is total number of entries
    let output = [#entry.short]
    if entry.long != none {
      output = [#output -- #entry.long]
    }
    if entry.description != none {
      output = [#output: #entry.description]
    }
    block(
      grid(
        columns: (auto, 1fr, auto),
        output,
        repeat([#h(0.25em) . #h(0.25em)]),
        entry.pages,
      )
    )
  }
)

#glossary(theme: my-theme)
#glossary(title: "Glossary with just empty group", groups: ("",), theme: my-theme)
#glossary(title: "Glossary with just Web group", groups: ("Web",), theme: my-theme)
