class CreateDetentorTypes < ActiveRecord::Migration
  def change
    create_table :detentor_types do |t|
      t.string :name, unique: true, null: false
    end
  end
end
