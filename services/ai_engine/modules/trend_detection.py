import numpy as np


def trend_score(series: list[float]) -> float:
    if len(series) < 2:
        return 0.0
    x = np.arange(len(series))
    slope = np.polyfit(x, np.array(series), 1)[0]
    normalized = max(0.0, min(1.0, (slope + 10) / 20))
    return float(round(normalized, 4))
