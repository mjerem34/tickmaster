class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, unique: true, null: false
    end
  end
end
