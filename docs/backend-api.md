# Backend API Spec

Base URL:
- FastAPI: `http://127.0.0.1:8001/api/v1`
- Node orchestrator: `http://127.0.0.1:8002/api/v1`

## Core Endpoints

### Projects
- `POST /projects`
- `GET /projects`
- `GET /projects/{project_id}`

### Keyword Hunter
- `POST /keywords/discover`
- `POST /keywords/cluster`
- `GET /keywords/opportunities?project_id=...`

### Trend Radar
- `POST /trends/scan`
- `GET /trends/top?window=24h`
- `GET /trends/emerging`

### Social Scanner
- `POST /social/scan`
- `GET /social/viral`

### AI Content Studio
- `POST /content/generate`
- `POST /content/optimize-seo`

### Content Gap
- `POST /competitor/analyze`
- `GET /competitor/gaps?project_id=...`

### Automation
- Node API `POST /automation/pipelines/run`
- Node API `POST /automation/schedules`
- Node API `GET /automation/tasks`

## Event Stream
- `GET /events/stream` (SSE): crawler progress, AI stages, pipeline state.
