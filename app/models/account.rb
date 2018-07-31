class Account < ApplicationRecord
  belongs_to :status, required: false
  belongs_to :contractor
end
