class UsersController < ApplicationController

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/users/signup'
    elsif User.find_by(username: params[:username])
      @user = User.find_by(username: params[:username])
      redirect to '/users/login'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
    end
    redirect to '/tweets'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/login' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/users/login'
    else
    end
    redirect to '/tweets'
  end

  get '/users/logout' do
    session.clear
  end

end
