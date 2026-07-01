---
name: aggregate
description: "DDD aggregate auditor and design facilitator. Use when the user wants to audit existing aggregate boundaries, review aggregate design, or run a boundary design workshop for a new requirement."
disable-model-invocation: true
argument-hint: "audit [subdomain] | workshop \"<new requirement>\""
---

## Commands

Check the argument before doing anything:

- **`/aggregate audit [subdomain]`** — audit existing aggregate boundaries in the codebase
- **`/aggregate workshop "<requirement>"`** — run a facilitated boundary design session for a new requirement
- **`/aggregate`** with no args — ask the user which mode they want, then proceed

---

## Setup — run before either mode

**Step 1 — Load the domain reference documents.**

Search for these files in the current directory tree:

```bash
find . -name "ubiquitous-language.md" -not -path "*/vendor/*" -not -path "*/node_modules/*"
find . -name "sub-domain-invariants.md" -not -path "*/vendor/*" -not -path "*/node_modules/*"
```

Read both files in full. If either is missing, warn the user and continue with what's available — these documents are context, not blockers.

If `subdomain` was specified, also look for these files scoped to that subdomain's directory path.

**Step 2 — Locate the domain model.**

Find aggregate roots, entities, and value objects. Adapt these patterns to the codebase language:

```bash
# Domain model directories (common conventions)
find . -type d \( -name "domain" -o -name "model" -o -name "aggregates" \) \
  -not -path "*/vendor/*" -not -path "*/node_modules/*"

# Go: struct definitions in domain paths
grep -rn "^type .* struct" . --include="*.go" \
  --exclude-dir=vendor --exclude="*_test.go" | grep -i "domain\|model\|aggregate"

# Annotations or comments marking roots
grep -rn "aggregate\|AggregateRoot\|// root" . \
  --include="*.go" --include="*.ts" --include="*.py" -l
```

If `subdomain` was specified, restrict the search to that path.

Read the identified files. Before proceeding, form a clear picture of:
- What aggregates exist and what their roots are
- What entities and value objects live inside each aggregate
- How aggregates reference each other (by ID or by direct object?)
- Where invariants are enforced (inside aggregates or in application services?)

**Step 3 — Cross-reference.**

Map each invariant in `sub-domain-invariants.md` to the aggregate(s) it touches. Note gaps — invariants that appear unenforceable from the model — before opening either mode.

---

## The six questions

These are the core diagnostic questions. Every audit finding and every workshop checkpoint is anchored to one of them. Memorise them — they are the tool.

1. **"What must be consistent at the same moment?"** — draws the consistency boundary
2. **"If X fails mid-write, does Y need to roll back?"** — tests whether two things belong together
3. **"Is this a transactional invariant or a pre-condition?"** — determines the enforcement layer
4. **"Is this a rule about what must be true, or about what to display?"** — separates consistency from retrieval
5. **"Which entity enforces the invariants across the others?"** — identifies the correct root
6. **"Has the business explicitly accepted eventual consistency?"** — licenses the outbox pattern

---

## Audit mode

See [AUDIT.md](./AUDIT.md) for the full procedure and output format.

## Workshop mode

See [WORKSHOP.md](./WORKSHOP.md) for the facilitation procedure.

## Heuristics and anti-patterns

See [HEURISTICS.md](./HEURISTICS.md) for the full reference — named anti-patterns, structural rules, and implementation patterns.
