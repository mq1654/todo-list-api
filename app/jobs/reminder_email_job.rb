class ReminderEmailJob < ApplicationJob
  queue_as :default

  def perform(todo_id)
    todo = Todo.find_by(id: todo_id)
    return unless todo

    TodoMailer.due_reminder(todo).deliver_now
  end
end
