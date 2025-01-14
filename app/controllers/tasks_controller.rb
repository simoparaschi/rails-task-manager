class TasksController < ApplicationController
  def list
    @tasks = Task.all
  end

  def find
    @id = params[:id]
    @current_task = Task.find(@id)
  end
end
