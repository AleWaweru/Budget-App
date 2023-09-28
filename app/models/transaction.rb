class Transaction < ApplicationRecord
  belongs_to :category
  validates :description, presence: true
  validates :amount, presence: true
end
