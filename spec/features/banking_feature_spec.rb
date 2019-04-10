require './banking/banking.rb'
account = Account.new
deposit = Deposit.new(1000, '10/01/2012')
deposit2 = Deposit.new(2000, '13/01/2012')
withdraw = Withdraw.new(500, '14/01/2012')
account.deposit(deposit.amount, deposit)
account.deposit(deposit2.amount, deposit2)
account.withdraw(withdraw.amount, withdraw)
account.shows_transaction_history
