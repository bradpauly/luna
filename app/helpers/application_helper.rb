# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def rc( text )
    r = RedCloth.new( text )
    r.to_html
  end
  
  def nl2br( text )
    text.gsub( /\n/, '<br />')
  end
  
  # def spam_protector
  #   values = '1,5,2,2,8'
  #   operators = '+,-,*'
  #   hidden_fields = ''
  #   hidden_fields += hidden_field_tag( '_sp_values', values )
  #   hidden_fields += hidden_field_tag( '_sp_operators', operators )
  #   hidden_fields += hidden_field_tag( '_sp_time', Time.now.to_i )
  # end
  
end
