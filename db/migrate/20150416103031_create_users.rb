class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :login
      t.string   :password
      t.string   :first_name
      t.string   :last_name
      t.string   :patronymic
      t.integer  :sex, :default => 0

      t.timestamps null: false
    end
  end
end