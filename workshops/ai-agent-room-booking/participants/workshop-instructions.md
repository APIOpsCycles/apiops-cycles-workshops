# Design an API your AI agent can trust

**Mini workshop · 28 minutes · groups of 3–4 · one laptop per group**

You provide a Room Booking API that AI assistants use on behalf of employees. Your challenge is to make it useful, safe and clear enough for an agent to complete a real task reliably.

You will import, improve and export one APIOps Cycles canvas. You do not need to write code or know HTTP methods.

## Your shared scenario

An employee asks: **“Book a suitable meeting room for six people tomorrow, 10:00–11:00, in my office.”**

This is a fictional company with three offices. Start with the employee's home office. The agent can ask the employee to clarify missing requirements. Interpret tomorrow using the employee's local date and time zone; do not silently assume the server's time zone. A suitable room has enough seats and meets any stated equipment or accessibility needs. Restricted rooms require permission. Search results describe availability at a point in time; they do not reserve a room.

Initially, the employee is responsible for choosing a time that suits attendees. The workshop host will introduce a change later. Record assumptions rather than inventing company policies.

Background files `01-customer-journey.json` and `02-domain.json` provide a completed starting point. They describe the human journey and shared concepts: office, room, booking and employee. The employee is the human consumer; the AI agent is the software acting for them.

## Get started

1. Open [Canvas Creator](https://canvascreator.apiopscycles.com/?locale=en).
2. Select **Import JSON** and open your group's starter file below. Import one canvas at a time. Export your work before importing another file.
3. Double-click inside a section to add a sticky note. Double-click an existing note to edit it; click outside the note to finish. Drag notes to arrange them.
4. Keep one idea per note. Use short labels and explain the details in your group's discussion. Challenge the starter notes as needed.
5. Before the surprise, choose your most important finding. After the surprise, change or add at least two notes.
6. Select **Export JSON**. Save as `team-[name]-[canvas]-revised.json`. Keep this editable file as your takeaway; an SVG or PNG export is optional.

Choose a driver to edit, a reader to check the challenge, a challenger to question assumptions and a reporter. Combine roles in a group of three.

## Group A — Make the API useful

**API Value Proposition Canvas · `03-value-proposition-starter.json`**

Make sure the agent can complete the employee's task. Add **at least five notes** across tasks, gain-enabling features, pain-relieving features and API products.

- What does “suitable” require beyond capacity?
- What information does a software agent need to choose, act and explain the result?
- Which uncertainties require a question to the employee?
- Which capabilities belong in the Room Booking API, and which might come from another API?

Your report: **“The agent needs ___ because ___. The API provider owns ___.”**

## Group B — Make the API safe and reliable

**Business Impact Canvas · `04-business-impact-starter.json`**

The current canvas uses **Risks and criticality** and **Mitigations and decision impact**. Use these sections for all three risk categories:

| Prefix | Starter risk | Your task |
| --- | --- | --- |
| A — availability | A1: API outage during office hours | Add at least one more availability risk. |
| S — security | S1: Agent books a restricted room | Add at least one more security risk. |
| D — data | D1: Two employees receive confirmation for the same room and time | Add at least one more data risk. |

For each new risk, add a matching mitigation with the same ID. State the consequence and whether you consider it high, medium or low priority. Add **at least six notes**: three new risks and three matching mitigations. The API provider must be able to enforce the mitigations even when the agent makes a mistake.

Use the other sections to record business consequences if time permits. Do not invent financial figures.

Your report: **“If ___ happens, the consequence is ___. The provider must enforce ___.”**

## Group C — Make the API understandable and actionable

**Interaction Canvas · `05-interaction-starter.json` · advanced option**

Focus on **Find available rooms** and **Reserve a room**. Leave reading a booking and cancellation events as context unless you have extra time.

For each focus interaction, add notes for:

- **Input:** What must the agent supply?
- **Output:** What must it receive to know what happened?
- **Processing and validation:** What must the booking system enforce?

Add **at least six notes**, one per question for each interaction. Make success and failure distinguishable without guessing from a human-readable sentence. Code is optional.

Your report: **“Finding a room tells us ___. Reserving it must guarantee ___.”**

## Share and take away

Each group has up to 45 seconds: one discovery, one change after the surprise and one provider responsibility. Show a note rather than reading the whole canvas.

Before you finish, save your revised JSON and identify one unanswered question with an owner. You should be able to explain how a consumer need leads to a risk and then to an interaction rule.

## Optional AI design review — after your first design

Use this after the core workshop, or when the facilitator explicitly substitutes it for part of the exercise. Export your canvas and provide it to an AI assistant with this prompt:

> Act as a critical reviewer of our API design. We are designing a room booking API that AI agents use on behalf of employees.
>
> Review the attached APIOps Cycles canvas. Identify three important missing requirements or incorrect assumptions.
>
> Focus on reliable AI agent actions. Distinguish between the responsibilities of the API provider and the AI agent.
>
> Do not redesign the entire canvas. For each finding, identify the affected section and explain the consequence.

Decide which suggestions to accept. Add one accepted suggestion and record one rejected suggestion with a reason. Export again. Use the fictional workshop data for this step.

## Continue in your own work

Bring a real consumer task, agree on the domain concepts, improve one canvas, challenge it with a failure scenario and carry the resulting rules into the API specification and acceptance tests. Continue through implementation, audit and publishing using the [APIOps Cycles method](https://apiopscycles.com/).

Canvas templates: APIOps Cycles and their credited authors; CC-BY-SA 4.0. Original template attribution is retained in the JSON metadata. Workshop scenario and adaptations: CC-BY-SA 4.0.
