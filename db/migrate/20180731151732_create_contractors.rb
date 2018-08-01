class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|

      t.string "uuid" 
      t.string "access_token"
      t.integer "identification"
      t.string "name"
      t.string "last_name"
      t.string "email"
      t.string "password_digest"
      t.string "password_confirmation"
      
    end
  end
end
