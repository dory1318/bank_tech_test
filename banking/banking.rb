class Account
  attr_reader :current_balance, :transaction_history

  def initialize
    @current_balance = 0
    @transaction_history = [['date, withdraw, deposit, balance']]
  end

  def deposit(money, deposit)
    @current_balance += money
    puts_deposit_into_transaction_history(deposit)
  end

  def withdraw(money, withdraw)
    @current_balance -= money
    puts_withdraw_into_transaction_history(withdraw)
  end

  def puts_deposit_into_transaction_history(deposit)
    @transaction_history << ["#{deposit.date}, 0, #{deposit.amount}, #{@current_balance}"]
  end

  def puts_withdraw_into_transaction_history(withdraw)
    @transaction_history << ["#{withdraw.date}, #{withdraw.amount}, 0, #{@current_balance}"]
  end

  def shows_transaction_history
    print @transaction_history.join("\n").split(",").join(" || ")
  end
end

class Deposit
  attr_reader :date, :amount

  def initialize(amount, date = Time.now.strftime("%d/%m/%Y"))
    @date = date
    @amount = amount
  end
end

class Withdraw
  attr_reader :date, :amount

  def initialize(amount, date = Time.now.strftime("%d/%m/%Y"))
    @date= date
    @amount = amount
  end
end
