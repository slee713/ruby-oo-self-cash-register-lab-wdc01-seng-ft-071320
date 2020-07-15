require 'pry'

class CashRegister
    attr_accessor :total, :discount, :all_items, :item_prices

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @all_items = []
        @item_prices = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times{@all_items.push(title)}
        @item_prices<<price * quantity
        @total += price * quantity
    end

    def apply_discount
        if @discount > 0
            @total -= @total.to_f*@discount/100
            "After the discount, the total comes to $#{@total.to_i}."
        elsif @discount == 0
            "There is no discount to apply."
        end
    end

    def items
        @all_items
    end

    def void_last_transaction
        @total -= @item_prices.last()
        @item_prices.pop()
        return @total
    end

end
# binding.pry