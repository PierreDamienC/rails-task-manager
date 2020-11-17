class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save

    redirect_to "/tasks/#{@task.id}"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)

    redirect_to "/tasks/#{@task.id}"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to "/"
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details)
  end
end
