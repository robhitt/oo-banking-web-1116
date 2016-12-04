require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end

    if valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    #binding.pry
    if @status == "complete"

      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
