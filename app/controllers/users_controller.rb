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
      erb :'/tweets'
    end
    binding.pry
    erb :'/tweets'
  end

  get '/login' do
    erb :'/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if params[:username] == "" || params[:password] == ""
      redirect to '/login'
    elsif @user
      session[:user_id] = @user.id
    end
    redirect to '/tweets'
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end
