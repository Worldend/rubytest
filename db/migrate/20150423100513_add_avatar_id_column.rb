class AddAvatarIdColumn < ActiveRecord::Migration
  def change
    add_column  :users, :avatar_id, :integer, after: :id
    add_index   :users, :avatar_id
  end
end
