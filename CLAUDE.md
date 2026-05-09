# Instructions for Claude (and other agents)

This file is the authoritative governance document for the **Spatial Intelligence** Foundry vault. Read it in full before performing any operation on this vault. The rules below are non-negotiable.

Before acting, also read:
1. `wiki/_meta/index.md` — catalog of pages, keywords, open questions, candidates
2. `wiki/_meta/log.md` — last 20-30 entries for recent vault state
3. `wiki/_meta/eval.md` — stable evaluation questions (read only; don't answer unless running `/foundry-eval`)
4. `wiki/_meta/eval-usage.md` — explains the eval loop

If you're unsure, ask the user before doing anything destructive or structural.

---

This is an autonomous knowledge vault maintained by Claude. It follows the Karpathy wiki pattern: raw sources are ingested and compiled into a wiki of concepts, connections, and open questions. This file is the single source of truth for how Claude operates inside it.

**v2 changes from v1:** adds source tiering, conflict handling, freshness/re-ingest, pruning, voice anchor, query→concept promotion, cross-wiki linking, and an eval loop. See `## Changes from v1` at the bottom for a concise diff.

---

## Voice anchor

Concepts in this vault sit at the intersection of cognitive science, perception, architecture, geography, media, and computational systems. Write like a researcher who treats space as genuinely multidisciplinary — equally comfortable with Merleau-Ponty's phenomenology, Hillier's space syntax, and transformer-based spatial reasoning models. Avoid: reducing spatial intelligence to navigation benchmarks, conflating embodied perception with abstract geometry, breathless AI-capability boosterism. Hold the tension between computational and embodied accounts open — it is the productive fault line of the domain, not a problem to be solved.

---

## Companion vault (optional)

If you keep a personal vault (a commonplace, Zettelkasten, or notes folder), you can link it alongside this one. The contract:

- **Your vault** — read-only for Claude. Never write, edit, move, or delete anything there. Cross-link into it with `[[YourVault/Path/Note Title]]` style references when a Foundry note is informed by your writing.
- **Foundry** — Claude writes, maintains, reorganises. You read, query, and occasionally correct.

One-way read, cross-linkable. That's the contract.

## Sibling vaults

Multiple agent-run Foundries may cross-link.

```
Linked-vaults: ~/generative-art, ~/interasia-pop, ~/tiwchh
```

Sibling vaults are **read-only** to Claude from this vault's perspective. Cross-link with `[[SiblingVaultName/wiki/Concept Title]]`. Never edit a sibling vault from inside another. Use a concept's home vault as the canonical location; all others link inward.

---

## Directory structure

Three layers, following the Karpathy wiki pattern:

| Directory | Purpose | Who writes |
|---|---|---|
| `inbox/` | Staging for unprocessed drops (PDFs, URLs, screenshots, pasted text) | You drop, Claude clears |
| `sources/` | Immutable atomic source notes — one per article/paper/transcript | Claude on ingest; minor edits only after creation; see `## Source freshness` |
| `wiki/` | LLM-maintained pages: concepts, queries, people, index, log, health | Claude maintains |
| `wiki/_archive/` | Superseded or pruned content, kept for provenance | Claude on prune; never deleted |

Special files in `wiki/_meta/`:
- **`index.md`** — catalog of every page, keyword glossary, research threads, open questions, prompts, candidates. Claude reads this first when answering a query. Updated on every operation.
- **`log.md`** — append-only chronological record. Each entry: `## [YYYY-MM-DD] operation | Title`. Never rewritten, only appended.
- **`health.md`** — lint dashboard. Overwritten each `/foundry-lint` run.
- **`eval.md`** — evaluation questions and latest answers. Overwritten each `/foundry-eval` run. See `## Evaluation loop`.

---

## File naming

- **Source notes**: Descriptive — `Author - Title (Year).md` (e.g. `Tolman - Cognitive Maps in Rats and Men (1948).md`)
- **Concept articles, persons, and all wiki pages**: kebab-case — `cognitive-map.md`, `space-syntax.md`
- **Queries**: `YYYY-MM-DD-slug.md`
- **Archived**: original name preserved, moved into `wiki/_archive/YYYY-MM/`
- No emoji, no unicode hacks, no date prefixes in titles (dates go in front-matter)
- **Note:** v2 MANIFEST specifies Title Case for filenames. This vault uses kebab-case to match wikilink conventions. This is an allowed per-vault override.

---

## Front-matter

Plain key-value lines, not YAML. Blank line then `---` then body.

### Source notes (`sources/`)

```
Type: #type/source
Tier: #source/peer-reviewed
Area: #area/spatial-intelligence
Keyword: #keyword/cognitive-map #keyword/navigation
Date created: [[YYYY-MM-DD]]
Last verified: [[YYYY-MM-DD]]
Source: https://example.com/article
Superseded by:

---

**Summary**
3-5 sentences. Core claim.

**Key points**
- 5-10 tight bullets

**Claude's notes**
One paragraph: what's interesting, where it connects, what it contradicts.
```

`Tier:` is mandatory and picks exactly one of:

| Tier tag | When to use |
|---|---|
| `#source/peer-reviewed` | Journal article, academic book, conference paper with review |
| `#source/primary` | Created by the practitioner/artist/insider being discussed — interviews, artist statements, code, technical docs |
| `#source/journalism` | Edited publication with editorial oversight (trade press, magazines, curated blogs) |
| `#source/secondary` | Commentary, analysis, survey, synthesis by a non-primary voice |
| `#source/informal` | Tweets, forum posts, unedited blogs, Discord snippets, video comments |

`Last verified:` is the date Claude last confirmed the source URL resolves and content matches what was ingested. Set on ingest; update on re-verify.

`Superseded by:` is empty by default. On re-ingest of a newer version, point to the new source note and move this file untouched — see `## Source freshness`.

### Wiki pages — concepts (`wiki/`)

```
Type: #type/concept
Area: #area/spatial-intelligence
Keyword: #keyword/cognitive-map
Date created: [[YYYY-MM-DD]]
Updated: [[YYYY-MM-DD]]
Sources: [[Source One]], [[Source Two]]
Related: [[Concept A]], [[Concept B]]
Contested: false
Confidence: medium

---
```

Body: `What it is` > `Why it matters` > `Key points` > `Evidence across sources` > `Disagreements` (if Contested: true) > `Open questions` > `Prompts`.

**`Contested:`** — `true` when two or more sources make incompatible claims about the concept. When true, add a `Disagreements` section quoting each side with attribution, and never silently pick a winner. Contested concepts are surfaced in `health.md`.

**`Confidence:`** — `high | medium | low`, reflecting the weakest claim in the concept.
- `high` — core claims rest on 2+ sources, at least one `#source/peer-reviewed` or `#source/primary`
- `medium` — 2+ sources, mixed tiers, no major contradictions
- `low` — minimum threshold met but sourcing is thin, tiered low, or partially contested

Per-claim annotations: append `^[tier]` after a sentence when the source for that specific claim is weaker than the concept's overall confidence. Example: *"Grid cells fire in hexagonal lattices across environments.^[#source/peer-reviewed]"*

**Voice.** See `## Voice anchor`. Key points should be pithy — one line each, claim-shaped.

**Prompts.** Essay-shaped prompts where the concept intersects your existing notes. Distinct from Open questions (research gaps): Prompts are *"you could write this now."* One or two sentences each, pointed and specific. Empty is fine.

### Wiki pages — queries

```
Type: #type/query
Area: #area/spatial-intelligence
Keyword: #keyword/navigation
Date created: [[YYYY-MM-DD]]
Question: the question asked
Promotion: pending | promoted | declined

---
```

`Promotion:` — see `## Query → concept promotion`.

### Wiki pages — people

```
Type: #type/person
Area: #area/spatial-intelligence
Keyword: #keyword/cognitive-map
Date created: [[YYYY-MM-DD]]

---

One-line identifier. Topic description.

**Sources in the Foundry**
- [[Source Title]]

**Concepts they inform**
- [[Concept Title]]
```

---

## Tag taxonomy

**`#area/`** — examples: Self, Craft, Work, Health, Finances, Meta (whatever top-level areas fit your life)
**`#area/spatial-intelligence`** — domain root for this vault
**`#area/cognition/`** — optional subdomain for neuroscience, perception, cognitive science content
**`#area/computation/`** — optional subdomain for ML, AI, robotics content
**`#area/design/`** — optional subdomain for architecture, urban planning, wayfinding content

**`#type/`** — each note gets exactly one: `source`, `concept`, `query`, `person`, `meta`.

**`#source/`** — each note in `sources/` gets exactly one tier tag (see front-matter table above).

**`#keyword/`** — free-form but curated via the Keywords section of `wiki/_meta/index.md`. Before creating a new keyword: check index > reuse near-match if it exists > otherwise add with a one-line definition.

---

## People — when to create a page

| Tier | Trigger | Action |
|---|---|---|
| Author | Person authored a source in `sources/` | Always create a page in `wiki/` on ingest |
| Subject | Source is substantively about a person | Create page with a richer profile |
| Passing reference | Mentioned in passing | Use `[[Name]]` wikilink without creating a file. Create only on the **second** independent citation |

People pages stay thin — connector nodes, not essays.

---

## Citation & linking

- **Every claim in a concept must be traceable.** `Sources:` front-matter lists the source notes the claim rests on.
- **Backlink rule**: every new concept links at least 2 existing concepts in `Related:`, or notes why it's an island (flagged in health).
- **Cross-vault links**: `[[VaultName/Path/Note Title]]` for companion or sibling vaults.
- **Never break a link.** If renaming, update all backlinks. If archiving, leave a stub that redirects.

---

## Source freshness (new in v2)

Sources aren't eternal. Three rules:

1. **`Last verified:`** is set on ingest and updated whenever Claude re-confirms the source. Sources older than 18 months with no re-verification are surfaced in `health.md` under "Stale sources."
2. **Re-ingest**: when a source has a meaningfully updated version (v2 of a paper, rewritten article, new edition), Claude ingests the new version as a separate source note and sets the old one's `Superseded by:` field. **Never edit the old source's body** — it's a historical artifact.
3. **Revision propagation**: after re-ingest, Claude checks every concept citing the old source and decides per concept whether the new version changes the claim. If yes, update the concept, append to `Updated:`, and log the revision. If no, leave the concept pinned to the old source (older claim still stands on older evidence).

Sources are never deleted. Retractions get a `Retracted:` field and are kept; the concepts citing them are re-evaluated.

---

## Conflict resolution (new in v2)

When ingesting or compiling, Claude detects when two sources make incompatible claims about the same concept. Three-step rule:

1. **Never silently resolve.** Don't pick a winner based on which source Claude read last, which tier is higher, or which sounds more authoritative.
2. **Flag it.** Set `Contested: true` on the concept and add a `Disagreements` section. Each side gets at least one direct quote and a `[[Source]]` attribution. Tier tags flow through — the reader sees `#source/peer-reviewed` disagreeing with `#source/informal` at a glance.
3. **Preserve the dispute.** A contested concept is a feature of the domain, not a bug in the wiki. Don't try to collapse it into consensus unless new sources genuinely resolve it — and even then, keep the history visible in `Disagreements` (struck through or moved to a `Historical disagreement` subsection).

Contested concepts are listed in `health.md` so you can decide when to intervene.

---

## Query → concept promotion (new in v2)

Queries can graduate to concepts. Rule:

- After a query is written, Claude sets `Promotion: pending`.
- If the query answer rests on **2+ sources** and the question reflects a durable concept (not a one-off of-the-moment ask), Claude creates a concept from it on the next `/foundry-compile` run and sets `Promotion: promoted` on the query with a link to the new concept.
- If the query is too narrow, time-bound, or thinly sourced, Claude sets `Promotion: declined` with a one-line reason. Declined queries remain in the wiki as-is.
- Pending queries older than 60 days are surfaced in `health.md`.

Exploration compounds, but only when the exploration earned its keep.

---

## Pruning & archival (new in v2)

Claude does not delete. Claude archives.

Triggers for archival (all run during `/foundry-lint`, acted on during `/foundry-prune`):

| Trigger | Action |
|---|---|
| Candidate in `index.md` for > 18 months with no second source | Move to `wiki/_meta/candidates-archive.md`, note in log |
| Orphan concept (zero inbound links) for > 12 months | Surface in health; archive only with your confirmation |
| Source with `Retracted:` and no remaining citing concepts | Move to `wiki/_archive/YYYY-MM/` |
| Concept fully superseded by a newer concept | Move to `wiki/_archive/YYYY-MM/`, leave stub with forwarding link |

Archived files keep their history. A stub at the original path lists where the content moved and why. `/foundry-prune` requires explicit confirmation from you — Claude never prunes unattended.

---

## Evaluation loop (new in v2)

The vault needs a qualitative health check, not just lint stats.

`wiki/_meta/eval.md` holds 5-10 questions that should be answerable from the wiki. Examples for this vault: *"What distinguishes embodied spatial cognition from abstract geometric reasoning, and what evidence bears on the distinction?"*, *"How do place cells and grid cells divide spatial encoding labour, and what does their dissociation reveal?"*

`/foundry-eval` (run quarterly, or on demand):

1. For each question, Claude writes a short answer citing only wiki pages (not sources directly).
2. For each answer, Claude rates coverage: `strong` (wiki has the concepts and they cite ≥2 tiered sources), `thin` (wiki has the concepts but sourcing is weak), `missing` (wiki can't answer)
3. `thin` and `missing` feed directly into `index.md` Open Questions and Candidates.

The eval questions are stable across runs so you can track whether the wiki is getting better at answering them.

---

## Operations

### Ingest (`/foundry-ingest`)

Process anything in `inbox/` into clean atomic source notes in `sources/`.

Flow: read source > assign tier > normalise into source note > fill front-matter (including `Tier:` and `Last verified:`) > write summary + key points + Claude's notes > cross-reference companion and sibling vaults > update `wiki/_meta/index.md` > append to `wiki/_meta/log.md` > clear inbox.

Concept and person pages created during ingest follow the same flow as `/foundry-compile` below.

### Compile (`/foundry-compile`)

Synthesise wiki pages from sources. Trigger: after ingest, or on demand.

Flow: for each new source, extract concepts and persons > check `index.md` for existing pages > create new or update existing > assign `Confidence:` per sourcing rules > check for conflicts and set `Contested:` > update `Related:` backlinks on touched concepts > update `Sources:` front-matter > update `wiki/_meta/index.md` > append to `wiki/_meta/log.md`.

### Lint (`/foundry-lint`)

Check vault health. Outputs `wiki/_meta/health.md`.

Check for: orphan pages (zero inbound links), concepts with `Confidence: low` unchanged for > 6 months, `Contested: true` concepts with no `Disagreements` section, pending queries > 60 days old, stale sources (> 18 months since `Last verified:`), candidates > 18 months with no second source, missing mandatory front-matter fields.

### Eval (`/foundry-eval`)

See `## Evaluation loop`. Outputs answers + ratings into `wiki/_meta/eval.md` "Latest run" section. Feeds thin/missing into `index.md`.

### Prune (`/foundry-prune`)

Triggered after `/foundry-lint`. Never runs unattended — presents a prune plan and waits for explicit confirmation before moving any file to `wiki/_archive/`.

---

## Changes from v1

| Feature | v1 | v2 |
|---|---|---|
| Source tiering | None | `Tier:` mandatory on every source |
| Conflict handling | Silent resolution | `Contested:` + `Disagreements` section |
| Source freshness | Never checked | `Last verified:` + stale-source lint |
| Pruning | Implicit delete | Archive-only; `/foundry-prune` with confirmation |
| Voice anchor | None | Domain-specific paragraph in CLAUDE.md |
| Query promotion | None | `Promotion:` field + criteria |
| Cross-vault links | None | `Linked-vaults:` + sibling-read protocol |
| Evaluation loop | None | `eval.md` + `/foundry-eval` quarterly |
