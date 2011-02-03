class Category < ActiveRecord::Base
  # associations
  has_many :articles

  # validations
  validates :title, :presence => true

  def recent_articles(count=3)
    articles.order("created_at DESC").take count
  end
end
