class MailsWaiting < ActiveRecord::Migration
  def change
    create_table :mails_waiting do |t|
      t.string :sender_mail
      t.string :receiver_mail
      t.string :object
      t.text :content
      t.date :date_to_attempt
      t.integer :number_of_attempts
      
      t.timestamps null: false
    end
  end
end
