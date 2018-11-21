class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    elsif User.find_by(username: params[:username])
      @user = User.find_by(username: params[:username])
      redirect to '/login'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
    end
    redirect to '/tweets'
  end

  get '/login' do
    erb :'/login'
  end

  post '/login' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/login'
    else
    end
    redirect to '/tweets'
  end
end
