class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name, balance=1000.00)
    @name=name
    @balance=balance
    @status="open"
  end
  def deposit(amount)
    @balance+=amount
  end
  def withdrawal(amount)
    if @balance>=amount
      @balance-=amount
    else
      p "Insufficient funds."
    end
  end
  def display_balance
    "Your balance is $#{@balance}."
  end
  def valid?(amount=0)
    if @status=="open" && @balance > amount
      true
    else
      false
    end
  end
  def close_account
    @status="closed"
    @balance=0
  end
end
