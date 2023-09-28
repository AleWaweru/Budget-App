class Category < ApplicationRecord
  has_many :transactions, dependent: :destroy
  attribute :total_amount, :integer
end
