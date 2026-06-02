---
title: Health Dashboard
tags:
  - index
  - meta
draft: true
created: 2026-05-31
updated: 2026-05-31
---

# Health Dashboard

Local-only health checks. Not published to the Quartz site (`draft: true`).

---

## Orphaned Concepts (no incoming links)

```dataview
TABLE file.inlinks AS "Backlinks"
FROM "wiki/concepts"
WHERE length(file.inlinks) = 0
SORT file.name ASC
```

---

## Orphaned Sources (no incoming links)

```dataview
TABLE file.inlinks AS "Backlinks"
FROM "wiki/sources"
WHERE length(file.inlinks) = 0
SORT file.name ASC
```

---

## Concepts Missing Tags

```dataview
LIST
FROM "wiki/concepts"
WHERE length(tags) = 0
SORT file.name ASC
```

---

## Sources Missing Tags

```dataview
LIST
FROM "wiki/sources"
WHERE length(tags) = 0
SORT file.name ASC
```

---

## Sources Missing URL

```dataview
LIST
FROM "wiki/sources"
WHERE !url
SORT file.name ASC
```

---

## Sources Missing Tier

```dataview
LIST
FROM "wiki/sources"
WHERE !tier
SORT file.name ASC
```

---

## Recently Modified (last 7 days)

```dataview
TABLE file.mtime AS "Modified"
FROM "wiki/concepts" OR "wiki/sources"
WHERE file.mtime >= date(today) - dur(7 days)
SORT file.mtime DESC
```

---

## All Tags in Use

```dataview
LIST rows.file.link
FROM "wiki/concepts" OR "wiki/sources"
FLATTEN tags
GROUP BY tags
SORT tags ASC
```
