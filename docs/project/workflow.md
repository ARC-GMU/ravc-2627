# How we work

GitHub is the single source of truth. **Issues** are the work, the **Project board** is the plan, and **these docs** are the knowledge.

## The loop

1. **Plan:** every piece of work is an issue created from the *Task* template.
2. **Schedule:** set `Start date` and `Target date` on the issue in the Project. This is what draws the bars on the Roadmap (Gantt-style) view.
3. **Build:** branch from `main`, name it `<issue-number>-short-description`, open a PR that says `Closes #<n>`.
4. **Review:** one teammate approves; the subsystem owner is the default reviewer.
5. **Document:** update the relevant page under `docs/` in the same PR.

## Project fields

| Field | Purpose |
|-------|---------|
| Status | Backlog → Ready → In progress → In review → Done |
| Subsystem | Mechanical, Electrical, Firmware, Software, Perception, Testing, Docs |
| Start date / Target date | Positions the item on the Roadmap view |
| Iteration | Weekly or biweekly sprint |
| Milestone | Maps to a [project milestone](milestones.md) |

## Views to create

Views are created in the Project UI. Suggested set:

- **Roadmap:** layout *Roadmap*, Start = `Start date`, Target = `Target date`, group by Subsystem, markers on Milestones.
- **Board:** layout *Board*, columns by Status.
- **My work:** layout *Table*, filter `assignee:@me`.
- **Current sprint:** layout *Table*, filter `iteration:@current`.

## Dependencies and sub-issues

- Use sub-issues to break a large item (e.g. "Drive base") into owned tasks; the parent shows progress.
- Record blockers on the issue ("Blocked by #12"). The Roadmap view positions items by date but does not draw dependency arrows, so check blockers when you set dates.

## Rules of thumb

- If it isn't an issue, it isn't scheduled.
- Keep issues small enough to finish in about a week.
- Update the Status when you start and finish. The board is only useful if it's current.
