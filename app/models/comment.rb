class Comment < ActiveRecord::Base
  
  belongs_to :post
  after_create { |comment| NotificationMailer.deliver_comment(comment) }
  
  # This if for comment spam. Must be blank.
  attr_accessor :occupation
  
  validates_presence_of :name, :email, :body
  
  def validate
    unless ( self.occupation && self.occupation.to_s == '' )
      errors.add_to_base('Umm, are you a spam bot?')
    end
  end
  
end
