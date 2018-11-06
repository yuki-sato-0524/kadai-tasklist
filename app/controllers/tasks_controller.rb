class TasksController < ApplicationController
  
  before_action :set_task, only: [:show,:destroy,:edit,:update]
  before_action :require_user_logged_in, only:[:show,:new,:create,:edit,:update,:destroy]
  before_action :correct_user, only: [:destroy,:edit,:update,:show]
  
  
  def index
    if logged_in?
      #@tasks = Task.all.order("created_at DESC").page(params[:page]).per(20)
      @tasks = current_user.task.order("created_at DESC").page(params[:page]).per(20)
    end
  end

  def show
  end

  def new
    @task = current_user.task.build
  end

  def create
    @task = current_user.task.build(task_params)
    
    if @task.save
      flash[:success] = "タスクを登録しました"
      redirect_to @task
    else
      flash[:danger] = "登録できませんでした"
      render :new
    end
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      flash[:success] = "タスク内容更新！"
      redirect_to @task
    else
      flash[:danger] = "タスク更新失敗！"
      render :edit
    end
  
  
  end

  def destroy
    @task.destroy
    
    flash[:success] = "削除完了！"
    redirect_to tasks_url
  end
  
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def correct_user
    @user = current_user.task.find_by(id: params[:id])
    
    redirect_to root_url unless @user
  end

  def task_params
    params.require(:task).permit(:content,:status)
  end

end



