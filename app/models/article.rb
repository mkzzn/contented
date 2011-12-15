class Article < ActiveRecord::Base
  # associations
  has_many :comments, :dependent => :destroy
  has_many :attachments, :as => :attachable
  belongs_to :featured_image, :class_name => "Attachment"
  belongs_to :category
  belongs_to :user

  accepts_nested_attributes_for :attachments, :allow_destroy => true

  # validations
  validates_presence_of :title, :allow_blank => false
  validates_presence_of :body, :allow_blank => false

  scope :uncategorized, where(:category_id => nil)
  scope :published, where(:published => true)

  def body_markdown
    require 'rdiscount'
    RDiscount.new(body).to_html.html_safe
  end

  def category_name
    categorized? ? category[:title] : "Uncategorized"
  end

  def author_name
    user.full_name rescue nil
  end

  def categorized?
    category ? true : false
  end

  def created_date
    created_at.strftime("%Y-%m-%d") rescue nil
  end

  def published_state
    published ? "Published" : "Unpublished"
  end
end
