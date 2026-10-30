---
type: Concept
title: Area Map
x-ai-rulez:
  kind: context
  id: area-map
  metadata:
    priority: high
---

## Area Map

Permanent archive of xberg-io Python wheels and sdists, published as GitHub Release assets and indexed on GitHub Pages.

- `.github/workflows/index.yaml` — rebuilds the simple index from every release manifest and deploys Pages
- `mise-tasks/index/verify.sh` — `mise run index:verify` checks the generated index
- Releases are named `<normalized-project>-v<version>`; publishers use `xberg-io/actions/archive-python`
