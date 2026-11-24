# Reference answers and discussion notes

These are possible design decisions for a fictional workshop. They are not a finished API specification. The green reference canvases contain short labels; use these notes to explain the decisions after participants present.

## A — Usefulness and API boundaries

Useful features include filtering by capacity, equipment, accessibility, office and time; reserving and cancelling; looking up a booking's authoritative status; and explaining a rejected request with a machine-readable reason. Dates and times need explicit interpretation, including time zones.

After the surprise, distinguish calendar availability from physical feasibility. Free/busy alone does not prove an employee can travel to another office, enter it or attend in person. Ask whether remote attendance is acceptable and which travel or access constraints matter. Respect permission to view calendar data; the agent may need only free/busy, not meeting titles.

A defensible boundary is: Room Booking owns rooms, availability and reservations; a Calendar API supplies authorised attendee free/busy; a Directory API supplies office information and permitted employee context. The agent coordinates these capabilities and asks the employee to resolve ambiguous preferences. Other boundaries can work if the group explains ownership and dependencies.

Checking all calendars and then reserving a room does not guarantee attendees remain free. Decide whether invitations are in scope and how to recover if calendar updates fail. Record this as follow-up work rather than quietly promising an atomic transaction across unrelated systems.

## B — Provider controls and business consequences

| Category | Additional risk and consequence | Enforceable provider mitigation |
| --- | --- | --- |
| Availability | Retry bursts overload the service and delay other employees. | Apply quotas/rate limits and return a retry signal; monitor saturation and protect scarce resources. |
| Security | An agent reads or cancels another employee's private booking. | Enforce delegated identity and object/action authorisation on every request, including status lookup. Limit returned data and record an audit trail. |
| Data | A lost response leads to duplicate actions or inconsistent confirmation. | Bind an idempotency key to the caller's scope and request intent, persist the operation outcome and return the same result on safe replay. |

Priorities depend on the company and usage; ask participants to justify their rating. Measure staff time, repair work or failed bookings rather than inventing a return-on-investment figure.

**Five retries:** A timeout means the outcome is unknown. It does not prove the booking failed. The provider needs safe replay and a way to retrieve an authoritative result.

- For one logical operation, the agent reuses the same key and same request. The provider must handle simultaneous replays safely. Reusing a key with a different payload must produce a clear rejection.
- Specify key scope, retention and expiry behavior. Once a deduplication record expires, a retry may no longer be safe; the agent should reconcile status rather than blindly create another operation.
- A repeated request can be reported as still processing or replay the persisted result. Avoid claiming confirmation before the reservation is committed.
- Idempotency prevents repeated execution of the same operation. An atomic availability check and reservation prevents two different operations from obtaining overlapping bookings for one room. Both matter.
- Rate limiting limits traffic; it does not itself prevent duplicate bookings. Backoff is an agent responsibility supported by provider retry guidance.
- If the room booking is already committed but notifications fail, notification recovery should not create a second booking. Track these outcomes separately.

## C — Inputs, outputs and enforceable rules

| Interaction | Inputs | Outputs | Provider rules |
| --- | --- | --- | --- |
| Find available rooms | Time interval with explicit zone/offset, office scope, capacity and required features | Room IDs, relevant attributes and snapshot context | Validate the interval; filter according to access; search creates no reservation. |
| Reserve a room | Room ID, time interval, authenticated delegated context and an idempotency key | Confirmed booking ID and details, or an explicit conflict/rejection; processing status if asynchronous | Authorise the action, validate capacity/policy, commit only if no overlap, persist the result and handle replay safely. |
| Read booking | Booking or operation identifier plus authenticated context | Authoritative status and permitted details | Enforce access, distinguish not-found from unknown outcome without leaking private records. |
| Booking cancelled event | Authorised subscription/filter context | Event ID, booking ID, occurrence time and cancellation state | Protect delivery, define duplicate/out-of-order handling and allow reconciliation with current booking state. |

The canvas does not require HTTP choices. If a group uses HTTP, a conflict response such as 409 is a possible choice, paired with a stable error code such as `ROOM_UNAVAILABLE`. The contract must define the code and what the agent can do next.

**Race between search and reserve:** The provider atomically checks and reserves. If another employee won the slot, the second request returns an explicit conflict and creates no booking. The agent can search again. It should ask the employee before changing material preferences outside its delegated authority. A new room or time is a new operation; do not reuse a key bound to a different request.

An optional expiring hold is another valid design, but introduces hold ownership, expiry, release and fairness rules. Do not imply that a search result is a hold.

## Convert discoveries into acceptance criteria

1. Given an unauthorised employee, when an agent reserves a restricted room, the provider rejects the action and creates no booking.
2. Given one committed reservation and a lost response, when the same caller safely retries the same request and key within the documented retention period, exactly one logical booking exists and the original result is recoverable.
3. Given two independent requests for overlapping intervals in one room, at most one reservation is confirmed; the losing operation has an explicit conflict outcome.
4. Given an operation whose outcome is unknown, the agent can retrieve a status or safely replay according to the contract; it never reports a booking as confirmed merely because it sent a request.

Use these as the bridge from canvases to specification, implementation, tests, audit and publishing.
