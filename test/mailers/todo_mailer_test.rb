require "test_helper"

class TodoMailerTest < ActionMailer::TestCase
  test "due_reminder" do
    mail = TodoMailer.due_reminder
    assert_equal "Due reminder", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
