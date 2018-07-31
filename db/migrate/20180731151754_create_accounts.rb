class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.datetime "account_date"
      t.integer "contractor_id"
      t.string "concept"
      t.string "value"
      t.integer "status_id"
      t.timestamps
    end
  end
end
