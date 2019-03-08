class GoalsController < ApplicationController

  get '/home' do
    erb :'goals/home'
  end
end
