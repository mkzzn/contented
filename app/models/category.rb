class Category < ActiveRecord::Base
  # associations
  has_many :articles

  # validations
  validates :title, :presence => true

  # callbacks
  after_destroy :remove_article_categories

  def recent_articles(count=3)
    articles.order("created_at DESC").take count
  end

  protected
  def remove_article_categories
    Article.where(:category_id => id).each do |article|
      article.update_attributes :category_id => nil
    end
  end
end
