from playwright.sync_api import sync_playwright


def crawl_google_trends(keyword: str) -> list[dict]:
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()
        page.goto(f"https://trends.google.com/trends/explore?q={keyword}", wait_until="domcontentloaded")
        title = page.title()
        browser.close()
    return [{"keyword": keyword, "source": "google_trends", "title": title}]


if __name__ == "__main__":
    print(crawl_google_trends("ai marketing"))
