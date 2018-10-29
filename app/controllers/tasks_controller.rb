class TasksController < ApplicationController
  
  before_action :set_task, only: [:show,:destroy,:edit,:update]
  
  def index
    @tasks = Task.all.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
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

  def task_params
    params.require(:task).permit(:content,:status)
  end

end



