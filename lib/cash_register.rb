class CashRegister
  attr_accessor :total, :discount, :quantity

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @title = []
    @last_item_cost = 0
  end


  def add_item(title, price, quantity=1)
    @total += price * quantity
    @title << [title] * quantity
    @last_item_cost = price * quantity
  end

  def apply_discount
    if @discount == 0.0
      @total = @total
      return "There is no discount to apply."
    else
      @total = @total - (@total * (@discount / 100.0))
    end
    return "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    @title.flatten
  end
  def void_last_transaction
    @total = @total - @last_item_cost
    @title.pop
  end
end
