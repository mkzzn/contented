class Article < ActiveRecord::Base
  # associations
  has_many :comments, :dependent => :destroy
  has_many :attachments, :as => :attachable
  belongs_to :category

  accepts_nested_attributes_for :attachments

  # validations
  validates_presence_of :title, :allow_blank => false
  validates_presence_of :body, :allow_blank => false

  scope :uncategorized, where(:category_id => nil)

  def category_name
    categorized? ? category[:title] : "Uncategorized"
  end

  def categorized?
    category ? true : false
  end
end
