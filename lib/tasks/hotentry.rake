namespace :hotentry do
  desc 'fetch hotentry'
  task fetch_with_bookmark_count: :environment do
    Rake::Task['hotentry:fetch'].invoke
    Rake::Task['bookmark_count:fetch'].invoke
  end

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
