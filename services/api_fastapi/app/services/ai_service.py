from collections import defaultdict


def cluster_keywords(keywords: list[str]) -> dict[str, list[str]]:
    grouped: dict[str, list[str]] = defaultdict(list)
    for keyword in keywords:
        head = keyword.split()[0]
        grouped[head].append(keyword)
    return grouped


def generate_marketing_content(topic: str, content_type: str) -> dict:
    return {
        "title": f"{content_type.upper()} | {topic}",
        "outline": ["Pain point", "Solution", "CTA"],
        "h1": topic,
        "h2": [f"Lợi ích của {topic}", f"Checklist triển khai {topic}"],
        "meta_description": f"Khám phá {topic} và chiến lược thực chiến để tăng trưởng marketing.",
        "faq_schema": {
            "@context": "https://schema.org",
            "@type": "FAQPage",
            "mainEntity": [
                {
                    "@type": "Question",
                    "name": f"{topic} là gì?",
                    "acceptedAnswer": {"@type": "Answer", "text": f"{topic} là phương pháp marketing dựa trên dữ liệu."},
                }
            ],
        },
    }
