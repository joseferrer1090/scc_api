class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|

      t.integer "identification"
      t.string "name"
      t.string "last_name"
      t.string "email"
      t.string "password"
      t.string "password_confirmation"

    end
  end
end
