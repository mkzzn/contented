module ArticlesHelper
  def comments_link(article)
    extend ActionView::Helpers::TextHelper
    link_to(pluralize(article.comments.count, "comment"), (article_path(article) + "#comments"), :class => "comments")
  end
end
