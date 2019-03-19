require 'rack-flash'

class UsersController < ApplicationController

  use Rack::Flash

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "You have entered invalid credentials. Please try again."
      redirect '/signup'
    elsif User.find_by(username: params[:username])
      flash[:message] = "Username already exists"
      redirect '/'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/home'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/home'
    else
      flash[:message] = "You have entered invalid credentials. Please try again or sign up."
      redirect '/'
    end
  end

end
