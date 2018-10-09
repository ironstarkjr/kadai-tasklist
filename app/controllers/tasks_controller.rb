class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
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
  end

  def update
    if @task.update(task_params)
      flash[:success] = "タスクを更新しました"
      redirect_to @task
    else
      flash[:danger].now = "タスクの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "タスクを削除しました"
      redirect_to root_url
    else
      flash[:danger].now = "タスクの削除に失敗しました"
      render @task
    end
  end
  
  private
    def set_task
      @task = Task.find(params[:id])   
    end
  
    def task_params
      params.require(:task).permit(:content, :status)
    end
  
end
