module CommentsHelper
  
  def name_and_website(comment)
    if comment.website.blank?
      comment.name
    else
      link = comment.website.include?('http') ? comment.website : ('http://' + comment.website)
      link_to(comment.name, link)
    end
  end
  
end
