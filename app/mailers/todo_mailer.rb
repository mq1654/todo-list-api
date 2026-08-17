class TodoMailer < ApplicationMailer
  def due_reminder(todo)
    @todo = todo
    @user = todo.user
    mail(
      to: @user.email,
      subject: "Reminder: Job '#{@todo.title}' is due soon"
    )
  end
end
