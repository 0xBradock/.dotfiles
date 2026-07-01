# Audit Procedure

You have already completed Setup (read reference docs, located domain model, cross-referenced invariants). Now apply the heuristics systematically.

## Inspection checklist — per aggregate

For each aggregate you found, work through every item. Record findings as you go.

**Consistency boundary**
- Does this aggregate's boundary match a genuine transactional invariant, or was it drawn by convenience (same table, same module, same team)?
- Cross-reference with `sub-domain-invariants.md`: are all invariants touching this aggregate actually enforced by it? Are any enforced in the application service that should be inside the aggregate?

**Size and containment**
- Does the aggregate contain entities that have their own independent lifecycle (created separately, deleted separately, mutated without touching the root)? → candidate for extraction (God Aggregate)
- Does the aggregate reference another aggregate by direct object, not by ID? → structural violation
- Are relationships modelled as full entities when a value object (ID + a few properties) would suffice?

**Root correctness**
- Does the root enforce every invariant that spans its child entities?
- Can external code put any child entity into an invalid state without going through the root?
- Is the root chosen by invariant ownership, or by access frequency / structural position? (Wrong Root)

**Cross-aggregate coordination**
- Are there invariants in `sub-domain-invariants.md` that span two separate aggregates?
  - If they require atomicity → Premature Split
  - If the business accepts eventual → check that the outbox pattern (or equivalent) is in place
  - If they're pre-conditions → check that enforcement is in the application service, not the aggregate
- Are cross-aggregate references by ID only?

**Retrieval vs consistency**
- Are any aggregates merged because reads require data from both? (Retrieval-Driven Merger)
- Is any aggregate loaded wholesale to answer a query that could be served by a read model?

## Output format

Present findings as a structured report. Group by aggregate. Lead with the most severe finding in each group.

```
## Aggregate Audit: [Subdomain or "full codebase"]

### [AggregateName]
File: path/to/file.go (or equivalent)

  [CRITICAL] <Named Pattern> — one-sentence description of the problem
  Evidence: the specific code or structure that shows it
  Question: which of the six questions this finding answers
  Fix: concrete recommendation

  [WARNING] <Named Pattern> — ...
  [NOTE] ...

### [AggregateName]
...

---
### Summary

| Aggregate       | Findings | Worst |
|----------------|----------|-------|
| OrderAggregate | 2        | CRITICAL |
| ...            | ...      | ...   |

Top priority: [the one thing to fix first and why]
Healthiest: [the aggregate that best embodies the principles]
```

**Severity levels:**
- **CRITICAL** — a transactional invariant is unenforceable, a structural rule is violated, or the boundary actively causes data integrity risk
- **WARNING** — a named anti-pattern is present; the system works but will cause pain as it scales
- **NOTE** — a design choice that is suboptimal but low-risk; worth revisiting when the area is next touched

## After the report

Offer to go deeper on any finding, or to run a workshop session (`/aggregate workshop`) to redesign a specific aggregate boundary.
