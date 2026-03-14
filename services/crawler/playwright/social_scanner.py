from dataclasses import dataclass
from typing import Iterable


@dataclass
class SocialSignal:
    platform: str
    hashtag: str
    engagement: float


def normalize_social_signals(raw: Iterable[dict]) -> list[SocialSignal]:
    signals: list[SocialSignal] = []
    for item in raw:
        views = float(item.get("views", 0))
        likes = float(item.get("likes", 0))
        shares = float(item.get("shares", 0))
        engagement = (likes + shares * 2) / (views + 1)
        signals.append(SocialSignal(platform=item.get("platform", "unknown"), hashtag=item.get("hashtag", ""), engagement=engagement))
    return signals
