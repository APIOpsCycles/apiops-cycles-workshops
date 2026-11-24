# Contributing workshop materials

Keep each workshop in its own folder under `workshops/`. Separate participant materials from facilitator guides, surprise cards and reference answers.

For the room booking workshop:

1. Edit Markdown instructions and guides directly.
2. Import a JSON file into the [online Canvas Creator](https://canvascreator.apiopscycles.com/?locale=en), make changes and export JSON.
3. Replace the corresponding file. Keep section IDs compatible with the current canvas definition and preserve original template credits and licensing.
4. Verify the import, readability, note editing and JSON export in Canvas Creator. Check that participant instructions agree with the canvas content.
5. Keep the timed agenda realistic. Reveal surprises only after the first design step. Explain reference choices as examples rather than a unique answer.
6. Run `pwsh -File scripts/build-archives.ps1` to rebuild participant and complete ZIPs. Inspect both archives before attaching them to a release.

Avoid real employee or customer data. Describe fictional assumptions clearly. Submissions must be compatible with this repository's CC BY-SA 4.0 license.

For a release, use a version tag such as `v1.0.0`, describe the included workshops and attach both ZIPs from `dist/`. Do not commit generated ZIP files.
