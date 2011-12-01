class Article < ActiveRecord::Base
  # associations
  has_many :comments, :dependent => :destroy
  has_many :asset_links, :as => :attachable
  has_many :assets, :through => :asset_links
  belongs_to :category

  # validations
  validates_presence_of :title, :allow_blank => false
  validates_presence_of :body, :allow_blank => false
  validate :validate_attachments

  scope :uncategorized, where(:category_id => nil)
  
  MAX_ATTACHMENTS = 25
  MAX_ATTACHMENT_SIZE = 2.megabytes

  def validate_attachments
    errors.add_to_base("Too many attachments - maximum is #{Max_Attachments}") if assets.length > MAX_ATTACHMENTS
    assets.each {|a| errors.add_to_base("#{a.name} is over #{Max_Attachment_Size/1.megabyte}MB") if a.file_size > MAX_ATTACHMENT_SIZE}
  end

  def category_name
    categorized? ? category[:title] : "Uncategorized"
  end

  def categorized?
    category ? true : false
  end
end
