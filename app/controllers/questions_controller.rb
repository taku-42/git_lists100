class QuestionsController < ApplicationController
  before_action :move_to_index
  
  def category
    @questions1 = Question.where(category: 1).where.not(user_id: current_user.id).sample(5)
    @questions2 = Question.where(category: 2).where.not(user_id: current_user.id).sample(5)
    @questions3 = Question.where(category: 3).where.not(user_id: current_user.id).sample(5)
    @questions4 = Question.where(category: 4).where.not(user_id: current_user.id).sample(5)
  end
  
  def new
    @question = Question.new
    @questions = Question.where(user_id: current_user.id, category: params[:category_id], achive: 0)
    @category_id = params[:category_id]
  end
  
  def create
    question =Question.create(question_params)
    @questions = Question.where(user_id: current_user.id, category: question.category, achive: 0)
  end
  
  def destroy
    Question.find(params[:id]).destroy
    @questions = Question.where(user_id: current_user.id, achive: 0)
    @answers = Question.where(user_id: current_user.id, achive: 1)
  end
  
  def indestroy
    question = Question.find(params[:id])
    question.destroy
    @questions = Question.where(user_id: current_user.id, achive: 0, category: question.category)
  end
  
  def achive
    question = Question.find(params[:id])
    if question.user_id == current_user.id
      question.update(achive: 1)
    end
    @questions = Question.where(user_id: current_user.id, achive: 0)
    @answers = Question.where(user_id: current_user.id, achive: 1)
  end
  
  private
  def question_params
    params.require(:question).permit(:text, :category).merge(user_id: current_user.id, achive: 0)
  end
  
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end
