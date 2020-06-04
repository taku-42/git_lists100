class TopController < ApplicationController
  
  
  def index
    @users = User.all
    @questions = Question.where(achive: 0)
    @answers = Question.where(achive: 1)
  end
  
  
end
