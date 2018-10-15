class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks
  end

  def show
  end
  
  def new
    @task = current_user.tasks.build
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを追加しました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの追加に失敗しました"
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
      flash.now[:danger] = "タスクの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "タスクを削除しました"
      redirect_to root_url
    else
      flash.now[:danger] = "タスクの削除に失敗しました"
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
    
    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      unless @task
        redirect_to login_url
      end
    end
  
end
