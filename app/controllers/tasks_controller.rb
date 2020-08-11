class TasksController < ApplicationController

# As a user, I can list tasks;
# recuperer toutes les tasks et les stocker dans une variable d'instance;
  def index
    @tasks = Task.all
  end

# As a user, I can view the details of a task
  def show
    @task = Task.find(params[:id])
  end

# As a user, I can add a new task
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[as: :task])
    @task.save
    redirect_to task_path(@task)
    params.require(:task).permit(:title, :details, :completed)

  end

#   private

#   def task_params
#     params.require(:task).permit(:title, :details, :completed)
#   end

# As a user, I can edit a task (mark as completed / update title & details)
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])
    redirect_to task_path(@task)
    params.require(:task).permit(:title, :details, :completed)
  end

# As a user, I can remove a task
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

end
