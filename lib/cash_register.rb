class CashRegister
  attr_accessor :name, :total, :discount, :quantity, :items_array, :last_name, :last_price, :last_quantity

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items_array = [] #YOU NEED TO DO THIS SO THAT AN INSTANCE HAS ACCESS TO THIS VAR
  end

  def add_item(name, price, quantity = 1)
    quantity.times do
      @items_array << name
    end
    @total += price * quantity

    @last_name = name
    @last_price = price * quantity
    @last_quantity = quantity
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= @total*@discount*0.01 #ex: 20*0.01 = 0.20 which equals 20% off
      int_total = @total.to_i #convert from float to integer (to remove the decimal point)
      return "After the discount, the total comes to $#{int_total}."
    end

  end

  def items
    return @items_array
  end

  def void_last_transaction
    @total -= @last_price
    #technically you should also remove the names from the array
    @items_array
    @last_quantity.times do
      @items_array.delete(@last_name)
    end
  end

end

new_register = CashRegister.new
new_register.add_item("eggs", 1.99)
new_register.add_item("tomato", 1.76, 3)
new_register.items
new_register.void_last_transaction
new_register.items


# puts new_register.why
# expect(new_register.items).to eq(["eggs", "tomato", "tomato", "tomato"])
