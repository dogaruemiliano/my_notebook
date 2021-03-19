class AddUserToPostits < ActiveRecord::Migration[6.0]
  def change
    add_reference :postits, :user, index: false, null: false
  end
end
