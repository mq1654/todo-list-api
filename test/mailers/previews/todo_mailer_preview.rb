# Preview all emails at http://localhost:3000/rails/mailers/todo_mailer
class TodoMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/todo_mailer/due_reminder
  def due_reminder
    todo = Todo.first || Todo.new(title: "Sample Task", due_date: Time.current + 1.day, user: User.first || User.new(email: "user@example.com"))
    TodoMailer.due_reminder(todo)
  end
end
