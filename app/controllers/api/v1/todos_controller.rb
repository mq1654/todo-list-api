class Api::V1::TodosController < ApplicationController
  before_action :set_todo, only: [ :show, :update, :destroy ]
  def index
    render json: current_user.todos.includes(:user), status: :ok
  end

  def show
    render json: @todo
  end

  def create
    todo = current_user.todos.new(todo_params)
    if todo.save
      if todo.due_date.present?
        ReminderEmailJob.set(wait_until: todo.due_date - 1.hour).perform_later(todo.id)
      end
      render json: todo, status: :created
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    head :no_content
  end

  private
  def set_todo
    @todo = current_user.todos.find_by(id: params[:id])
    render json: { error: "Not found" }, status: :not_found unless @todo
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :status, :due_date)
  end
end
