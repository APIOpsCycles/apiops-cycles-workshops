# Facilitator guide — Design an API your AI agent can trust

**28 minutes, mixed audience, groups of 3–4.** Default to Groups A and B; offer C to participants comfortable discussing interaction design. Success means participants import, edit and export a canvas, discover requirements for reliable agent actions and connect the canvases.

## Prepare

- Share only `ai-agent-room-booking-participants.zip` before the exercise. Keep this guide, surprise cards and reference canvases until their scheduled reveal.
- Open [the APIOps Cycles metro map](https://apiopscycles.com/) and [Canvas Creator](https://canvascreator.apiopscycles.com/?locale=en) on the presentation laptop.
- Test an import, edit and export on the room's network. Pre-open the two background canvases for a short demonstration. Browser downloads must be allowed.
- Allocate one laptop per group. Use a timer and assign the group tracks in advance. Show the relevant participant challenge while teams work.
- Explain the Business Impact layout: availability, security and data are categories of notes in the current canvas's shared risk/mitigation sections. The supplied materials deliberately use current section IDs rather than obsolete import-template IDs.

## Run of show

| Time | Facilitate | Evidence to look for |
| --- | --- | --- |
| 0–3 min | Introduce the challenge and show the metro map. Briefly show the shared journey and domain. | Groups understand who the employee and agent are. |
| 3–6 min | Demonstrate Import JSON, adding a note, editing it and Export JSON. Assign A/B/C. | Every group has its assigned starter open. |
| 6–14 min | Groups work. Ask questions; avoid supplying reference answers. Announce two minutes remaining at minute 12. | A: five notes. B: three new risks and three matching mitigations. C: six input/output/rule notes. |
| 14–19 min | Reveal the matching surprise card. Require at least two revised or added notes; export before minute 19. | Teams change their design rather than merely discuss it. |
| 19–25 min | Invite 45-second reports: discovery, surprise change, provider responsibility. | The group points to concrete notes. |
| 25–28 min | Connect one finding from each track. Confirm exports and name next steps. | Each group has JSON and an unanswered question with an owner. |

Opening script: **“An AI agent is trying to book a room for an employee. Your API must help it act correctly, including when things go wrong. The canvases let us connect the human need, business consequences and interaction rules. Today you will improve one of them and test your thinking against a change.”**

Minute 14 script: **“Your first design met the original challenge. Now the situation changes. Read your surprise, identify the assumption it breaks and change at least two notes.”**

## Coaching questions

**A:** “How does the agent know the room is suitable? What is missing? Who owns the missing information?”

**B:** “What is the consequence? Can the provider enforce that control if the agent retries or ignores advice? Is this mitigation preventing the failure or helping recover from it?”

**C:** “What can change between search and reserve? What exactly tells the agent whether the action succeeded? What can it safely do next?”

Avoid treating fluent agent explanations as proof of a booking. Ask for an authoritative outcome from the provider.

## Debrief: connect the canvases

Tell one linked story and, if possible, add one cross-cutting note live:

1. **Customer Journey + Domain:** The employee needs a suitable room; a booking is a reservation for a room and time interval.
2. **Value Proposition:** The agent needs to reserve a room and explain a trustworthy result.
3. **Business Impact:** Duplicate or conflicting confirmations waste employee time and undermine trust.
4. **Interaction:** The provider must commit reservations atomically, support safe retries and return a clear outcome.
5. **Next work:** Specify the contract, implement the controls, test failure cases, audit and publish. Revisit earlier canvases when new requirements appear.

Closing script: **“One consumer need became a capability, a risk and an interaction rule. Keep your exported JSON. In your own work, start with a real task, challenge your design with a failure and turn the resulting rules into acceptance tests.”**

## Adapt the session

- **Three groups:** One group per canvas if there is enough technical experience; otherwise two B groups and one A group.
- **Six groups:** Two groups per track. Six 45-second reports take 4.5 minutes, leaving 1.5 minutes for transitions.
- **More than six groups:** Ask groups on each track to compare briefly and nominate a reporter. Everyone still exports their own canvas.
- **Mostly beginners:** All groups use B. Give different groups the retry, restricted-room or API-outage variation from the surprise cards.
- **25 minutes:** Use two minutes for opening, three for demo, seven for initial work, five for surprise, five for reports and three for debrief.
- **30 minutes:** Add two minutes for groups to compare one accepted and one rejected AI review suggestion. For a full AI review exercise, add five minutes beyond the core workshop.
- **Tool/network problem:** Use the participant instructions and handwritten notes grouped by canvas section. Save a photo and transfer the notes to Canvas Creator afterwards. Describe this as a fallback; it does not satisfy the import/edit/export learning outcome during the session.

## Reference material

The three reference JSON files are deliberately concise examples for discussion. `reference-answers.md` explains the important details behind their labels. Share them after groups present. There is no single correct API boundary or endpoint design; assess whether the choices satisfy the stated task and explain failure behavior.
