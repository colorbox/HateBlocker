namespace :hotentry do
  desc "fetch hotentry"
  task fetch: :environment do
    url = 'http://b.hatena.ne.jp/hotentry/game.rss'
    xml = HTTPClient.get(url).body

    Feedjira::Feed.parse(xml).entries.each do|entry|
      Entry.create(title: entry.title, url: entry.url, category: 'game')
    end
  end
end
