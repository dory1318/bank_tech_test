require './banking/banking.rb'

describe 'Banking app' do
  account = Account.new

  it 'has a starting balance' do
    expect(account.current_balance).to eq 0
  end
  it 'can deposit money' do
    deposit = Deposit.new(1000, '18/03/1994')
    account.deposit(deposit.amount, deposit)
    expect(account.current_balance).to eq 1000
  end
  it 'can withdraw money' do
    withdraw = Withdraw.new(500, '18/03/1994')
    account.withdraw(withdraw.amount, withdraw)
    expect(account.current_balance).to eq 500
  end
end

describe 'Transaction' do
  account = Account.new
  it 's transaction history shows the transaction' do
    deposit = Deposit.new(1000, '10/01/2012')
    deposit2 = Deposit.new(2000, '13/01/2012')
    withdraw = Withdraw.new(500, '14/01/2012')
    account.deposit(deposit.amount, deposit)
    account.deposit(deposit2.amount, deposit2)
    account.withdraw(withdraw.amount, withdraw)
    expect(account.transaction_history).to eq [['date, withdraw, deposit, balance'], ["10/01/2012, 0, 1000, 1000"], ["13/01/2012, 0, 2000, 3000"], ["14/01/2012, 500, 0, 2500"]]
  end
end

describe 'Deposit' do
  it 'knows when money was deposited' do
    deposit = Deposit.new(1000, '18/03/1994')
    expect(deposit.date).to eq('18/03/1994')
  end

end

describe Withdraw do
  it 'knows when money was withdrawn' do
    withdraw = Withdraw.new(500, '18/03/1994')
    expect(withdraw.date).to eq('18/03/1994')
  end
end
