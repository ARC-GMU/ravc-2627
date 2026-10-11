# RAVC 2627

Team docs for the 2026-27 Raytheon Autonomous Vehicle Competition, built with MkDocs Material.

- Site: https://arc-gmu.github.io/ravc-2627/
- Project board: https://github.com/orgs/ARC-GMU/projects/7
- Club website: https://gmu.autonomousrobotics.club/
- Discord: https://discord.gg/zn93yRNZGb

## Preview locally

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

## Editing

- Pages are Markdown files under `docs/`.
- The navbar is set by `nav` in `mkdocs.yml`.
- Images and PDFs go in `docs/assets/`.

## Publishing

- Every push to `main` builds the site and publishes it to GitHub Pages.
- Pull requests that touch the docs run `mkdocs build --strict`, so broken links fail the check.

## Notes

- Material for MkDocs is in maintenance mode (fixes through Nov 2026). The version is pinned, so the site keeps building. Zensical, from the same team, reads `mkdocs.yml`, so migrating later should be straightforward.
- `mkdocs serve` prints a warning about MkDocs 2.0. It doesn't affect this project: `requirements.txt` keeps MkDocs below 2. Set `NO_MKDOCS_2_WARNING=true` to hide it.
