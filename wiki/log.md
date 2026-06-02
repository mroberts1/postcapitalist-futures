# Wiki Log

Chronological record of ingests, queries, and maintenance passes.

---

## [2026-05-31] setup | Plugin infrastructure — Dataview, Templater, Tag Wrangler

Created:
- `templates/Concept Article.md` — Templater scaffold for new concept articles
- `templates/Source Summary.md` — Templater scaffold for new source summaries
- `templates/Topic Index.md` — Templater scaffold for new topic index pages
- `wiki/indexes/Health Dashboard.md` — Dataview health checks: orphans, missing tags/URL/tier, recently modified, tag inventory (draft: true)
- `wiki/indexes/Tag Vocabulary.md` — canonical tag list with scope definitions and source_type/tier values (draft: true)

Updated:
- `wiki/indexes/Master Index.md` — added Dataview tables for concepts and sources; manual lists retained for Quartz published site
- `wiki/indexes/Hauntology.md` — added Dataview queries for concepts and sources by tag

Manual setup still required in Obsidian:
- Templater: Settings → Templater → set Template folder to `templates`; optionally map wiki/concepts → Concept Article, wiki/sources → Source Summary, wiki/indexes → Topic Index

## [2026-05-31] ingest | Accelerationism: how a fringe philosophy predicted the future we live in — Andy Beckett

Source: https://www.theguardian.com/world/2017/may/11/accelerationism-how-a-fringe-philosophy-predicted-the-future-we-live-in

Created:
- `wiki/sources/Accelerationism - Beckett.md` — Guardian longread (2017); CCRU history, Fisher biography, L/ACC vs R/ACC

Updated:
- `wiki/concepts/Accelerationism.md` — added CCRU History section (Zelazny origin, French roots, Warwick/CCRU founding and collapse)
- `wiki/indexes/Master Index.md` — added new source

## [2026-05-31] ingest | Postcapitalist Desire syllabus — Mark Fisher

Source: https://mroberts1.github.io/postcapitalist-desire/ (fetched via WebFetch from GitHub repo mroberts1/postcapitalist-desire)

Created:
- `wiki/sources/Postcapitalist Desire - Mark Fisher.md` — combined entry with full 15-lecture syllabus embedded
- `wiki/concepts/Accelerationism.md` — L/ACC vs R/ACC; CCRU/Land; Fisher's position
- `wiki/concepts/Xenofeminism.md` — Laboria Cuboniks; Hester; lineage from Firestone/Plant

Updated:
- `wiki/concepts/Acid Communism.md` — linked to Accelerationism, Xenofeminism, and Postcapitalist Desire course
- `wiki/indexes/Master Index.md` — added new source and concepts

## [2026-05-31] ingest | Capitalist Realism, Ghosts of My Life, K-Punk, Acid Communism — Mark Fisher

Sources: `raw/books/Capitalist Realism_*/`, `raw/books/Ghosts of My Life_*/`, `raw/books/K-Punk_*/`

Created:
- `wiki/sources/Capitalist Realism - Mark Fisher.md`
- `wiki/sources/Ghosts of My Life - Mark Fisher.md`
- `wiki/sources/K-Punk - Mark Fisher.md`
- `wiki/sources/Acid Communism - Mark Fisher.md`
- `wiki/concepts/Capitalist Realism.md`
- `wiki/concepts/Lost Futures.md`
- `wiki/concepts/Acid Communism.md`

Updated:
- `wiki/concepts/Hauntology.md` — expanded with Ghosts of My Life material; connected to Lost Futures and Acid Communism
- `wiki/indexes/Master Index.md` — added all new sources and concepts

K-Punk treated as single overview entry + Acid Communism as separate source. Tags drive cross-topic searchability; individual blog posts surface through concept article citations.

Also set up Quartz 4 static site generator (`quartz/`); site builds from `wiki/` via symlink. Serve with `make serve` from vault root.

## [2026-05-30] ingest | The Weird and the Eerie — Mark Fisher

Source: `raw/books/The Weird and the Eerie - Mark Fisher/` (full book, markdown)

Created:
- `wiki/sources/The Weird and the Eerie - Mark Fisher.md`
- `wiki/concepts/The Eerie.md` (priority — comprehensive)
- `wiki/concepts/The Weird.md`
- `wiki/concepts/Hauntology.md`
- `wiki/indexes/Hauntology.md` (topic index)
- `wiki/indexes/Master Index.md`

Tag: `#hauntology`. User requested emphasis on the eerie sections of the book.

## [2026-06-02] ingest | Inventing the Future: Postcapitalism and a World Without Work — Nick Srnicek & Alex Williams

Source: `raw/books/Inventing the Future_ Postcapit - Nick Srnicek/` (Verso, 2015)

Created:
- `wiki/sources/Inventing the Future - Srnicek Williams.md` — full source summary
- `wiki/concepts/Folk Politics.md` — central diagnostic concept; three axes of immediacy
- `wiki/concepts/Post-Work.md` — the political platform (automation, shorter week, UBI, work ethic)
- `wiki/concepts/Full Automation.md` — first demand; FALC
- `wiki/concepts/Universal Basic Income.md` — third demand; labour power transformation
- `wiki/concepts/Counter-Hegemony.md` — strategic orientation; Gramsci/Laclau/Mouffe
- `wiki/concepts/Left Modernity.md` — philosophical grounding; progress, universalism, emancipation
- `wiki/concepts/Synthetic Freedom.md` — constructed freedom of capacities vs. negative freedom
- `wiki/concepts/Hyperstition.md` — CCRU concept repurposed for left politics
- `wiki/indexes/Post-Work.md` — new topic index

Updated:
- `wiki/concepts/Accelerationism.md` — added links to Folk Politics, Post-Work, Full Automation, Hyperstition, Inventing the Future
- `wiki/concepts/Lost Futures.md` — added links to Folk Politics, Left Modernity, Hyperstition, Inventing the Future
- `wiki/indexes/Master Index.md` — added Post-Work topic index, all new concepts, new source; reorganised concepts into clusters

Tags: `#post-work`, `#folk-politics`, `#accelerationism`, `#left-politics`
