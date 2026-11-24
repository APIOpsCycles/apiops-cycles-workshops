# APIOps Cycles workshops

Hands-on workshop materials for designing APIs with [APIOps Cycles](https://apiopscycles.com/).

Participants use the [online Canvas Creator](https://canvascreator.apiopscycles.com/?locale=en) to import, edit and export the supplied JSON files. **No installation or local development environment is needed.**

## Workshops

| Workshop | Duration | Audience | Materials |
| --- | --- | --- | --- |
| Design an API your AI agent can trust | 28 minutes | Mixed audience; groups of 3–4; one laptop per group | [Participant instructions](workshops/ai-agent-room-booking/participants/workshop-instructions.md) · [Facilitator guide](workshops/ai-agent-room-booking/facilitator/facilitator-guide.md) |

The first workshop uses a fictional meeting-room booking scenario to explore useful capabilities, business risks and reliable agent interactions. It includes two completed background canvases, three starters, surprise challenges and three facilitator reference canvases.

## Download and run

Download the participant or complete ZIP from the [latest release](https://github.com/APIOpsCycles/apiops-cycles-workshops/releases/latest).

1. Facilitators read the guide and assign groups a canvas.
2. Share the **participant ZIP** before the session. Keep the surprise cards and reference answers for their scheduled reveal.
3. Participants open the online Canvas Creator, select **Import JSON** and choose their starter file.
4. Each group improves its canvas, responds to a surprise and uses **Export JSON** to save its work.

The complete ZIP and this public repository include facilitator answers. Avoid directing participants to those folders before the exercise.

## Maintain the materials

Edit prose in Markdown. To update a canvas, import its JSON into the online Canvas Creator, edit it, export it and replace the corresponding repository file. Preserve template attribution. See [CONTRIBUTING.md](CONTRIBUTING.md).

Maintainers can rebuild the two release ZIPs with PowerShell 7:

```sh
pwsh -File scripts/build-archives.ps1
```

Outputs are written to `dist/`. Participants only need a browser.

## License

Workshop materials and canvas adaptations are shared under **CC BY-SA 4.0**. Preserve the original canvas credits and share adaptations under the same license. See [LICENSE.md](LICENSE.md). All company details are fictional.
