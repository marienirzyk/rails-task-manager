class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new  # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(task_params)
    @task.save
      # No need for app/views/restaurants/create.html.erb
  redirect_to restaurant_path(@restaurant)

  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end


end

private

def task_params
  params.require(:task).permit(:tittle, :details, :completed)
end
