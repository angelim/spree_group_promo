module Spree
  class Promotion::Rules::ProductBuyGroupTotal < PromotionRule
    preference :amount, :decimal, :default => 100.00
    preference :operator, :string, :default => '>'
    preference :group, :string, :default => ''

    attr_accessible :preferred_amount, :preferred_operator, :preferred_group

    OPERATORS = ['gt', 'gte']

    def eligible?(order, options = {})
      group = Spree::ProductGroup.where(name: preferred_group).first
      item_total = 0.0
      order.line_items.each do |line_item|
        item_total += line_item.amount if group.products.include? line_item.product
      end
      item_total.send(preferred_operator == 'gte' ? :>= : :>, BigDecimal.new(preferred_amount.to_s))
    end
  end
end
