# Heuristics Reference

## Named anti-patterns

These are the patterns to name when you find or explain a mistake. Naming them is what makes the lesson travel out of the session.

### God Aggregate
**Symptom:** One aggregate contains many entities across multiple concerns — billing, membership, project state, notifications. It grows because adding things to it feels safe. It is loaded and locked on every operation, causing contention and slow writes.
**Test:** Does a change to one part of this aggregate frequently require loading the whole thing? Do unrelated operations conflict?
**Fix:** Identify which entities share a genuine transactional invariant. Extract the rest as separate aggregates referenced by ID.

### Anemic Root
**Symptom:** The aggregate root is a thin container — it holds child entities but delegates all logic to application services or domain services. Invariants are enforced outside the aggregate boundary.
**Test:** Can you put the aggregate in an invalid state by calling its setters directly, bypassing the application service?
**Fix:** Move invariant enforcement into the aggregate root's methods. The root must be the gatekeeper — external code should not be able to corrupt its state.

### Premature Split
**Symptom:** Two aggregates share a transactional invariant — something that must be true simultaneously across both. The developer reaches for domain events to coordinate them, creating complexity where containment was the right answer.
**Test:** Apply question 2 ("If X fails, does Y need to roll back?"). If yes, and the aggregates are separate, this is a premature split.
**Fix:** Reassess containment. If the lifecycle and size constraints allow it, absorb the smaller aggregate as an entity or value object inside the larger one.

### Retrieval-Driven Merger
**Symptom:** Two aggregates are merged because every read of one requires data from the other. The justification is query performance, not a transactional invariant.
**Test:** Apply question 4 ("Is this a rule about what must be true, or about what to display?"). If the answer is display, the merger is wrong.
**Fix:** Keep the aggregates separate. Solve the query problem with a read model or a projection — not by merging the write model.

### Wrong Root
**Symptom:** The root entity is chosen by frequency of access (most-queried entity), structural position (outermost in a hierarchy), or convention — not by which entity owns the invariants.
**Test:** Apply question 5 ("Which entity enforces the invariants across the others?"). If the answer is not the current root, the root is wrong.
**Fix:** Promote the invariant-enforcing entity to root. Demote the current root to an internal entity if appropriate.

---

## Structural rules

These apply to every aggregate, always:

- **Cross-aggregate references are by ID only.** An aggregate never holds a direct object reference to another aggregate root. It holds an ID and loads the other aggregate when needed.
- **The root is the only public entry point.** External code accesses entities inside the aggregate only through the root's methods — never directly.
- **Value objects for relationships.** When tracking a relationship that requires only identity plus a few properties (e.g. `memberID + role`), model it as a value object inside the aggregate rather than embedding the full entity. Only escalate to a contained entity if the relationship has its own lifecycle, commands, or events.
- **Aggregates should be small.** A large aggregate is a sign that consistency boundaries have not been drawn precisely enough. When in doubt, split — and then re-examine with question 2.

---

## Enforcement layer rules

- **Transactional invariants** (things that must succeed or fail together atomically) are enforced **inside the aggregate root**.
- **Pre-conditions** (guards checked before a write, with no atomicity requirement) are enforced in the **application service**. The application service reads one aggregate, validates, then writes to another.
- **Race windows** created by pre-condition checks are real. They must be explicitly accepted by the business — not silently tolerated. Document them.

---

## Implementation patterns

### When to use the outbox pattern
When the business has **explicitly accepted** eventual consistency between two aggregates:
1. Save the aggregate state and a domain event row in **one database transaction**
2. A relay goroutine polls the outbox table and publishes events to a bus or broker
3. A handler processes the event and writes the second aggregate in its own transaction, with retry on failure
4. Every handler must be **idempotent** — duplicate delivery must be a no-op

### When to use application-service pre-condition checks
When a rule is a guard (not an atomic requirement):
1. Application service loads the guarding aggregate (e.g. `Subscription`)
2. Validates the condition (e.g. `availableSeats > 0`)
3. Calls the target aggregate's method (e.g. `Team.addMember()`)
4. Two separate writes — no shared transaction
5. The race window is documented and business-accepted

### When to use a local transaction across two aggregates
When the business requires atomicity, the aggregates are co-located in the same database, and the split is correct for every other reason:
- This is acceptable, but it must be a **documented, conscious decision** — not a reflex
- Treat it as a smell to revisit: if the aggregates are always updated together, consider whether they should be one

### When to use an external broker (multi-service fan-out)
When multiple services need the same event:
- The relay publishes to an external broker (Kafka, RabbitMQ, NATS) instead of an in-process bus
- Each service subscribes independently
- Idempotency is mandatory for all consumers
