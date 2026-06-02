---
title: Index
tags:
  - index
created: 2026-05-30
updated: 2026-05-31
---

# Index

Central directory for the Mark Fisher knowledge base.

---

## Topic Indexes

- [[indexes/Hauntology|Hauntology]] — the eerie, the weird, hauntological music and film, lost futures
- [[indexes/Post-Work|Post-Work]] — automation, UBI, folk politics, left accelerationism, Srnicek/Williams

---

## Concepts

```dataview
TABLE aliases[0] AS "Also known as", tags AS "Tags"
FROM "wiki/concepts"
SORT file.name ASC
```

### Manual list (published site)

**Mark Fisher / Hauntology cluster**
- [[concepts/Capitalist Realism|Capitalist Realism]] — capitalism as naturalized atmosphere; business ontology; TINA
- [[concepts/Lost Futures|Lost Futures]] — the slow cancellation of the future; hauntology as temporal condition
- [[concepts/Acid Communism|Acid Communism]] — the spectre of a world which could be free; Marcuse; counterculture
- [[concepts/Hauntology|Hauntology]] — Derrida/Fisher; spectral presences; foreclosed futures; music
- [[concepts/The Eerie|The Eerie]] — failure of absence/presence; agency as central enigma
- [[concepts/The Weird|The Weird]] — presence of that which does not belong; fascination

**Accelerationism / Post-Work cluster**
- [[concepts/Accelerationism|Accelerationism]] — L/ACC vs R/ACC; Nick Land; CCRU; Fisher's position
- [[concepts/Folk Politics|Folk Politics]] — Srnicek/Williams's critique of the contemporary left's strategic common sense
- [[concepts/Post-Work|Post-Work]] — the political platform: full automation, shorter hours, UBI, work ethic
- [[concepts/Full Automation|Full Automation]] — first demand of the post-work platform; FALC
- [[concepts/Universal Basic Income|Universal Basic Income]] — unconditional income; transforms labour/capital relation
- [[concepts/Counter-Hegemony|Counter-Hegemony]] — strategic alternative to folk politics; Gramsci/Laclau/Mouffe
- [[concepts/Left Modernity|Left Modernity]] — reclaiming progress, universalism, and the future as left terrain
- [[concepts/Synthetic Freedom|Synthetic Freedom]] — constructed freedom of capacities vs. negative freedom
- [[concepts/Hyperstition|Hyperstition]] — CCRU concept; fiction that makes itself true; hyperstitional progress

**Cross-cutting**
- [[concepts/Xenofeminism|Xenofeminism]] — technology as emancipatory tool; Laboria Cuboniks; anti-naturalism

---

## Sources

```dataview
TABLE source_type AS "Type", date AS "Date", tier AS "Tier"
FROM "wiki/sources"
SORT date DESC
```

### Manual list (published site)
- [[sources/Capitalist Realism - Mark Fisher|Capitalist Realism]] (Mark Fisher, 2009)
- [[sources/Ghosts of My Life - Mark Fisher|Ghosts of My Life]] (Mark Fisher, 2014)
- [[sources/The Weird and the Eerie - Mark Fisher|The Weird and the Eerie]] (Mark Fisher, 2016)
- [[sources/K-Punk - Mark Fisher|K-Punk: The Collected Writings]] (Mark Fisher, 2018)
- [[sources/Acid Communism - Mark Fisher|Acid Communism (Unfinished Introduction)]] (Mark Fisher, 2018)
- [[sources/Postcapitalist Desire - Mark Fisher|Postcapitalist Desire: The Final Lectures]] (Mark Fisher, 2016–17 / Repeater 2020)
- [[sources/Accelerationism - Beckett|"Accelerationism: how a fringe philosophy predicted the future we live in"]] (Andy Beckett, *The Guardian*, 2017)
- [[sources/Inventing the Future - Srnicek Williams|Inventing the Future: Postcapitalism and a World Without Work]] (Nick Srnicek & Alex Williams, Verso 2015)

---

## Stats

```dataview
TABLE length(rows) AS "Count"
FROM "wiki/concepts" OR "wiki/sources" OR "wiki/indexes"
GROUP BY contains(file.folder, "concepts") ? "Concepts" : contains(file.folder, "sources") ? "Sources" : "Indexes"
```

- Last updated: 2026-06-02
