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
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクを追加しました"
      redirect_to @task
    else
      flash[:danger].now = "タスクの追加に失敗しました"
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "タスクを更新しました"
      redirect_to @task
    else
      flash[:danger].now = "タスクの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "タスクを削除しました"
    else
      flash[:danger].now = "タスクの削除に失敗しました"
      render @task
    end
  end
  
  private
    def task_params
      params.require(:task).permit(:content)
    end
  
end
