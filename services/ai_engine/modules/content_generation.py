import requests


def generate_with_ollama(model: str, prompt: str, host: str = "http://127.0.0.1:11434") -> str:
    response = requests.post(
        f"{host}/api/generate",
        json={"model": model, "prompt": prompt, "stream": False},
        timeout=120,
    )
    response.raise_for_status()
    return response.json().get("response", "")
