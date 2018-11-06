class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    
    if login(email,password)
      flash[:success] = "ログインしました"
      redirect_to root_path
    else
      flash[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    session[:user_id]=nil
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end
  
  private
  
  def login(email,password)
    @user = User.find_by(email: email)
    
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
