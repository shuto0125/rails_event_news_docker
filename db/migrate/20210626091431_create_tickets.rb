class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.references :user #退会機能を作る為にnullを許可
      t.references :event, null: false, foreign_key: true, index: false
      t.string     :comment

      t.timestamps

    end
    add_index :tickets, %i[event_id user_id], unique: true
  end
end
