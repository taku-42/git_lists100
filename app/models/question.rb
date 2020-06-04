class Question < ApplicationRecord
  belongs_to :user
  #validates_presence_of :user_id, :text, :category_id
end
