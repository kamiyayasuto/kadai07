class CreateTws < ActiveRecord::Migration
  def change
    create_table :tws do |t|
      
      t.text :content

      t.timestamps null: false
    end
  end
end
