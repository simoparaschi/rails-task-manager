class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @id = params[:id]
    # @current_task = Task.find(@id)
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(form_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    # @id = params[:id]
    # @current_task = Task.find(@id)
  end

  def update
    # @id = params[:id]
    # @current_task = Task.find(@id)
    @current_task.update(form_params)
    redirect_to task_path(@current_task)
  end

  def destroy
    # @id = params[:id]
    # @current_task = Task.find(@id)
    @current_task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def form_params
    params.require(:task).permit(:title, :details)
  end

  def find_task
    @id = params[:id]
    @current_task = Task.find(@id)
  end
end
