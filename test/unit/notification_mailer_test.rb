require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  tests NotificationMailer
  def test_comment
    @expected.subject = 'NotificationMailer#comment'
    @expected.body    = read_fixture('comment')
    @expected.date    = Time.now

    assert_equal @expected.encoded, NotificationMailer.create_comment(@expected.date).encoded
  end

end
