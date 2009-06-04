class NotificationMailer < ActionMailer::Base
  

  def comment(comment, sent_at = Time.now)
    subject    "Comment by #{comment.name}"
    recipients LUNA['email']
    from       comment.email
    sent_on    sent_at
    body       :comment => comment
  end

end
