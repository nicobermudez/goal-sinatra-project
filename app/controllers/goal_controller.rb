require 'rack-flash'

class GoalsController < ApplicationController

  use Rack::Flash

  get '/home' do
    @user = current_user
    @goals = user_goals
    erb :'goals/home'
  end

  get '/feed' do
    erb :'goals/feed'
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

  get '/goals/:id/edit' do
    if logged_in?
      @goal = Goal.find_by_id(params[:id])
      if @goal && @goal.user == current_user
        erb :"goals/edit-goal"
      else
        redirect to '/home'
      end
    else
      redirect to '/'
    end
  end

  patch '/goals/:id' do
    @goal = Goal.find_by_id(params[:goal][:id])
    if logged_in?
      if params[:goal][:title] == "" || params[:goal][:description] == "" || params[:goal][:action_plan] == "" || params[:goal][:deadline] == ""
        flash[:message] = "Entry not saved. Please do not leave any input blank. Try again."
        redirect to '/goals/:id/edit'
      else
        @goal = Goal.find_by_id(params[:id])
        if @goal && @goal.user == current_user
          if @goal.update(title: params[:goal][:title], description: params[:goal][:description], action_plan: params[:goal][:action_plan], deadline: params[:goal][:deadline])
            redirect to '/home'
          else
            flash[:message] == "You did not properly edit tweet, please try again"
            redirect to '/goals/:id/edit'
          end
        else
          redirect to 'home'
        end
        redirect to '/'
      end
    end
  end

  delete '/goal/:id/delete' do
    # goal.delete
  end

end
