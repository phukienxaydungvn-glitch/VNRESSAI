# TREND RADAR AI

Desktop AI Marketing Engine chạy hoàn toàn trên máy cá nhân, tích hợp crawler, AI analysis, SEO intelligence và automation pipeline.

## Thành phần chính
- **Desktop App**: Tauri + React/Next.js + Tailwind + Chart.js.
- **Local Backend**: FastAPI (AI/SEO APIs) + Node.js (job orchestration).
- **Crawler Engine**: Playwright/Puppeteer/Scrapy adapters.
- **AI Engine**: Ollama local LLM (Llama/Mistral/Mixtral).
- **Data Layer**: SQLite (mặc định local), hỗ trợ PostgreSQL.
- **Search Index**: Elasticsearch local single-node.
- **Queue**: Redis + BullMQ.

## Khởi chạy nhanh (development)
```bash
# 1) Backend AI API
cd services/api_fastapi && uvicorn app.main:app --reload --port 8001

# 2) Node Orchestrator
cd services/api_node && npm install && npm run dev

# 3) Frontend
cd apps/web && npm install && npm run dev

# 4) Tauri desktop shell
cd apps/desktop && npm install && npm run tauri dev
```

## Tài liệu
- Kiến trúc tổng thể: `docs/system-architecture.md`
- Sơ đồ module: `docs/module-diagram.md`
- Database schema: `database/schema.sql`
- API spec: `docs/backend-api.md`
- Installer: `infra/installer/windows.iss`
