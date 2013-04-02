class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :login
      t.string :password
      t.string :first_name
      t.string :lastname

      t.timestamps
    end
  end
end
