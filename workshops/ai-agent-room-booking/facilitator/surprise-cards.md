# Surprise cards — reveal at minute 14

Keep these separate from the participant ZIP until the reveal. Read only the card for the relevant group. Give groups five minutes to identify a broken assumption, revise at least two notes and export their canvas.

## Card A — Three offices, everyone can attend

**The employee now says: “Book a room in any of our three offices, but only if all six participants can attend.”**

What new information or functionality does the agent need? Define what “can attend” means. Which responsibilities belong in the Room Booking API, and which belong elsewhere? Record an unresolved assumption and its owner.

Report: **“We changed ___ because ___. We need ___ from ___.”**

## Card B — Five retries, no confirmation

**The agent sends a booking request. It receives no confirmation, then automatically retries five times. You do not know whether the first request succeeded.**

What could happen to bookings, capacity or service load? What must the API provider enforce, even when the agent behaves poorly? Distinguish preventing duplicate actions from preventing conflicting room reservations.

Report: **“A lost response could cause ___. Our provider control is ___.”**

## Card C — The room disappears

**The agent finds a suitable available room. Before it reserves that room, another employee books the same time slot.**

How should the API communicate the actual result? What must the booking system enforce? What can the agent safely do next, and when should it ask the employee?

Report: **“Search told us ___. Reservation now returns ___. The next safe action is ___.”**

## Optional B variations for an all-beginner session

**Restricted room:** The employee can view a room, but cannot reserve it. The agent attempts a booking anyway. Which control belongs at the provider, and how should it explain rejection without exposing private information?

**Office-hours outage:** Search is available, but booking requests fail during peak hours. What should the agent tell the employee? How can the provider make the state of an attempted booking discoverable when service returns?
