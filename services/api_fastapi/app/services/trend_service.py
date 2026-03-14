from datetime import datetime


def detect_emerging_topics(seed: str) -> list[dict]:
    now = datetime.utcnow().isoformat()
    return [
        {"topic": f"AI cho {seed}", "growth_rate": 0.82, "emerged_at": now},
        {"topic": f"Automation {seed}", "growth_rate": 0.76, "emerged_at": now},
        {"topic": f"UGC + {seed}", "growth_rate": 0.68, "emerged_at": now},
    ]
