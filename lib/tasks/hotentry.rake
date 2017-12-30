namespace :hotentry do
  desc 'fetch hotentry'
  task fetch: :environment do
    Entry.destroy_all
    Category.all.each do |category|
      url = "http://b.hatena.ne.jp/hotentry/#{category.kind}.rss"
      xml = HTTPClient.get(url).body
      Feedjira::Feed.parse(xml).entries.each do |entry|
        category.entries.create(title: entry.title, url: entry.url)
      end
    end
  end
end
