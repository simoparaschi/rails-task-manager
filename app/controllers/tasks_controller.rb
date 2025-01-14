class TasksController < ApplicationController
  def list
    @tasks = Task.all
  end

  def find
    @id = params[:id]
    @current_task = Task.find(@id)
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(form_params)
    @task.save
    redirect_to tasks_path
  end

  private

  def form_params
    params.require(:task).permit(:title, :details)
  end
end
