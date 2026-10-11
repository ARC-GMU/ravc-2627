# Robotics Project

Team docs (MkDocs Material, published to GitHub Pages) plus issue/PR templates for planning in GitHub Projects.

## Setup (about 10 minutes)

1. Create a GitHub repo and push this folder to `main`.
2. In `mkdocs.yml`, replace `<org-or-user>` and `<repo>` in `site_url` and `repo_url`.
3. Repo **Settings → Pages → Source: GitHub Actions**. The next push to `main` publishes the site.
4. Create the Project, labels and milestones:
   ```bash
   gh auth refresh -s project
   scripts/setup-github.sh <owner> <repo> "RAVC 2627"
   ```
   Then finish the manual steps the script prints (iteration field, status options, views).
5. Fill in `docs/project/team.md`, `overview.md` and `milestones.md`.

## Preview locally

```bash
pip install -r requirements.txt
mkdocs serve
```

## Notes

- Material for MkDocs is in maintenance mode (fixes through Nov 2026). The version is pinned, so the site keeps building. Zensical, from the same team, reads `mkdocs.yml`, so migrating later should be straightforward.
- `mkdocs serve` prints a warning about MkDocs 2.0. It doesn't affect this project: `requirements.txt` keeps MkDocs below 2. Set `NO_MKDOCS_2_WARNING=true` to hide it.
- PRs that touch `docs/` run `mkdocs build --strict` so broken links fail review.
