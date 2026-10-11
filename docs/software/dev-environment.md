# Dev environment

## Preview the docs locally

```bash
python -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
pip install -r requirements.txt
mkdocs serve                     # http://127.0.0.1:8000
```

## Robot software

<!-- Toolchain, OS, ROS/SDK versions, how to build and flash. -->

## Git conventions

- Branch from `main`: `<issue-number>-short-description`
- Small PRs, linked to an issue with `Closes #<n>`
- Don't commit large binaries; link to shared storage instead
