require 'rack-flash'

class GoalsController < ApplicationController

  use Rack::Flash

  get '/home' do
    @user = current_user
    @goals = user_goals
    erb :'goals/home'
  end

  get '/create-goal' do
    erb :"goals/create-goal"
  end

  post '/create-goal' do
    if params['goal'][:title] == "" || params['goal'][:description] == "" || params['goal'][:action_plan] == "" || params['goal'][:deadline] == ""
      flash[:message] = "You need to fill in each box in order to successfully create new goal"
      redirect to '/create-goal'
    else
      @user = current_user
      @goal = Goal.create(:title => params['goal'][:title], :description => params['goal'][:description], :action_plan => params['goal'][:action_plan], :deadline => params['goal'][:deadline], :user_id => @user.id)
      @goal.save

      flash[:message] = "You have successfully created a new goal. Carpe Diem!"
      redirect '/home'
    end
  end

  get '/feed' do
    erb :'goals/feed'
  end

end
