module CategoriesHelper
  def category_link(article)
    if article.categorized?
      link_to article.category_name, article.category
    else
      link_to "Uncategorized", uncategorized_articles_path
    end
  end
end
