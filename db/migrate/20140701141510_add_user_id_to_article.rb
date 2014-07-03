class AddUserIdToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :user_id, index: true
  end
end
