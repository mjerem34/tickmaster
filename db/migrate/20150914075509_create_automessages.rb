class CreateAutomessages < ActiveRecord::Migration
  def change
    create_table :automessages do |t|
      t.string :title, limit: 100
      t.text :content

    end
  end
end
