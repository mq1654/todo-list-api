# Preview all emails at http://localhost:3000/rails/mailers/todo_mailer
class TodoMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/todo_mailer/due_reminder
  def due_reminder
    TodoMailer.due_reminder
  end
end
