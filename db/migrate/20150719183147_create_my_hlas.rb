class CreateMyHlas < ActiveRecord::Migration
  
  def change
    rename_table :my_hlas, :hlas
  end 

  def change
    create_table :my_hlas do |t|
      t.string :title
      t.text :comment
      t.references :user, index: true
      t.integer :user_id

      t.timestamps
    end
  end
end
