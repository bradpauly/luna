class Post < ActiveRecord::Base
  
  has_many :comments
  
  validates_presence_of :title, :body
  
  before_create :set_published_at
  
  def to_param
    "#{ id }-#{ title.gsub(/[^a-z0-9]+/i, '-') }"
  end
  
  def first_paragraph
    body.split(/\r\n/).first
  end
  
  def set_published_at
    self.published_at = Time.now
  end
  
end
