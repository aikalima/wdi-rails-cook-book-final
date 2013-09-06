class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Cook Book app!"
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      redirect_to @user
    else
      render'new'
    end
  end


    #get '/forgot' => 'user#forgot_password'
  def forgot_password
    render :forgot_password
  end

  #get '/reset/:token' => 'user#reset_password'
  def reset_password
    @token = params[:token]
    @user = User.find_by_remember_token @token
    render :reset_password
  end

  #post '/send_reset' => 'user#reset_password'
  def send_reset
    # email in param
    email = params[:email]
    user = User.find_by_email email
    if user.nil?
      flash[:error] = "No such email:" + email
    else
      UserMailer.forgot_password_email(user).deliver
      flash[:success] = "Please check your email for instrcutions ..."
    end
    render :forgot_password
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    render :show
  end

end

