# Project Folder Structure

```text
VNRESSAI/
├─ apps/
│  ├─ desktop/               # Tauri shell
│  └─ web/                   # Next.js analytics UI
├─ services/
│  ├─ api_fastapi/           # AI + SEO API
│  ├─ api_node/              # Queue orchestration API
│  ├─ crawler/               # Playwright/Puppeteer/Scrapy workers
│  └─ ai_engine/             # ML + Ollama adapters
├─ automation/
│  └─ pipelines/             # Marketing workflow definitions
├─ database/
│  ├─ schema.sql             # 153-table local schema
│  └─ migrations/
├─ search_index/
│  └─ config/
├─ infra/
│  ├─ docker/
│  ├─ installer/
│  └─ scripts/
└─ docs/
```
