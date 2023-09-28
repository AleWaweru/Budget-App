# spec/models/transaction_spec.rb

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'is valid with valid attributes' do
    category = Category.create(name: 'Example Category')
    transaction = Transaction.new(
      description: 'Example Transaction',
      amount: 100.0,
      category:
    )
    expect(transaction).to be_valid
  end

  it 'is not valid without a category' do
    transaction = Transaction.new(
      description: 'Example Transaction',
      amount: 100.0
    )
    expect(transaction).to_not be_valid
  end
end
