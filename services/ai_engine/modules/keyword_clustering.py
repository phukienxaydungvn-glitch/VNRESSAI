from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans


def cluster_keywords(keywords: list[str], n_clusters: int = 3) -> dict[int, list[str]]:
    if len(keywords) <= n_clusters:
        return {i: [k] for i, k in enumerate(keywords)}

    vectorizer = TfidfVectorizer(ngram_range=(1, 2))
    X = vectorizer.fit_transform(keywords)
    model = KMeans(n_clusters=n_clusters, random_state=42, n_init="auto")
    labels = model.fit_predict(X)

    clusters: dict[int, list[str]] = {i: [] for i in range(n_clusters)}
    for keyword, label in zip(keywords, labels):
        clusters[int(label)].append(keyword)
    return clusters
