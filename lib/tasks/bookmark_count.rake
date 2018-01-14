namespace :bookmark_count do
  desc 'fetch bookmark_count'
  task fetch: :environment do
    Entry.all.each do |entry|
      url = "http://api.b.st-hatena.com/entry.count?url=#{entry.url}"
      bookmark_count = HTTPClient.get(url).body
      entry.update(bookmark_count: bookmark_count)
    end
  end
end
