atom_feed do |feed|
  feed.title "Detroit Fugue"
  feed.updated @articles.first.created_at

  @articles.each do |article|
    feed.entry article do |entry|
      entry.title article.title
      entry.content article.body, :type => 'html'

      entry.author do |author|
        author.author_name
      end
    end
  end
end
