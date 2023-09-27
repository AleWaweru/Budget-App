# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    category = Category.new(name: 'Example Category')
    expect(category).to be_valid
  end

  it 'has many transactions' do
    category = Category.new(name: 'Example Category')
    category.save

    transaction1 = Transaction.new(description: 'Transaction 1', amount: 100.0, category:)
    transaction2 = Transaction.new(description: 'Transaction 2', amount: 50.0, category:)

    transaction1.save
    transaction2.save

    expect(category.transactions).to include(transaction1, transaction2)
  end

  it 'destroys associated transactions when destroyed' do
    category = Category.new(name: 'Example Category')
    category.save

    transaction = Transaction.new(description: 'Transaction 1', amount: 100.0, category:)
    transaction.save

    expect { category.destroy }.to change(Transaction, :count).by(-1)
  end
end
