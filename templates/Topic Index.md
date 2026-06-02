---
title: "<% tp.file.title %> — Topic Index"
tags:
  - index
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
---

# <% tp.file.title %> — Topic Index



---

## Core Concepts

```dataview
LIST
FROM "wiki/concepts"
WHERE contains(tags, "REPLACE-TAG")
SORT file.name ASC
```

---

## Sources

```dataview
TABLE source_type, date, authors
FROM "wiki/sources"
WHERE contains(tags, "REPLACE-TAG")
SORT date DESC
```

---

## Open Questions / Future Sources

