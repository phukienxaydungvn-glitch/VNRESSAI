from fastapi import APIRouter
from pydantic import BaseModel

from app.services.ai_service import generate_marketing_content, cluster_keywords
from app.services.trend_service import detect_emerging_topics

router = APIRouter()


class KeywordDiscoverRequest(BaseModel):
    project_id: str
    seed: str


class ContentRequest(BaseModel):
    project_id: str
    content_type: str
    topic: str


@router.get("/projects")
def list_projects() -> dict:
    return {"items": []}


@router.post("/keywords/discover")
def discover_keywords(payload: KeywordDiscoverRequest) -> dict:
    base = payload.seed.strip().lower()
    variants = [
        base,
        f"{base} cho người mới",
        f"cách tối ưu {base}",
        f"{base} 2026",
    ]
    clusters = cluster_keywords(variants)
    return {"keywords": variants, "clusters": clusters}


@router.post("/trends/scan")
def scan_trends(payload: KeywordDiscoverRequest) -> dict:
    return {"topics": detect_emerging_topics(payload.seed)}


@router.post("/content/generate")
def generate_content(payload: ContentRequest) -> dict:
    return generate_marketing_content(payload.topic, payload.content_type)
