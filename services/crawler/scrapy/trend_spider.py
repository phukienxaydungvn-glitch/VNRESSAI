import scrapy


class TrendSpider(scrapy.Spider):
    name = "trend_spider"
    start_urls = [
        "https://news.ycombinator.com/",
    ]

    def parse(self, response):
        for item in response.css(".athing"):
            title = item.css(".titleline a::text").get()
            url = item.css(".titleline a::attr(href)").get()
            yield {
                "source": "hn",
                "title": title,
                "url": url,
            }
