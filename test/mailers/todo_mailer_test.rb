require "test_helper"

class TodoMailerTest < ActionMailer::TestCase
  test "due_reminder" do
    todo = todos(:one)
    mail = TodoMailer.due_reminder(todo)

    assert_equal "Reminder: Job '#{todo.title}' is due soon", mail.subject
    assert_equal [ todo.user.email ], mail.to
    assert_equal [ "sidekiq@example.com" ], mail.from
    assert_match "Todo#due_reminder", mail.body.encoded
  end
end
