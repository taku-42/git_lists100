class AddNicknamaToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :text
  end
end
