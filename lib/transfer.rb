require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
    @transaction= "#{@sender} #{@receiver} #{@amount}"
  end
  def valid?(amount=0)
    @sender.valid?(amount) && @receiver.valid?(amount)
  end
  def execute_transaction
    if @status=="complete"
      p "Transaction rejected, duplicate attempt."
    elsif self.valid?(@amount)
      @sender.withdrawal(@amount)
      @receiver.deposit(@amount)
      @status="complete"
      p "Transaction #{@status}. Anything else we can help you with, today?"
    else
      @status="rejected"
      p "Transaction #{@status}. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status=="complete"
      @sender.balance+=(@amount)
      @receiver.balance-=(@amount)
      @status="reversed"
    else
      p "Transaction not completed, cannot be reversed."
    end
  end
end
