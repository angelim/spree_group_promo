module Spree
  class Calculator::FlatPercentGroupTotal < Calculator
    preference :flat_percent, :decimal, :default => 0
    preference :group, :string, :default => ''
    
    attr_accessible :preferred_flat_percent, :preferred_group

    def self.description
      I18n.t(:flat_percent_group)
    end

    def compute(object)
      return unless object.present? and object.line_items.present?
      group = Spree::ProductGroup.where(name: preferred_group).first
      item_total = 0.0
      object.line_items.each do |line_item|
        item_total += line_item.amount if group.products.include? line_item.product
      end
      value = item_total * BigDecimal(self.preferred_flat_percent.to_s) / 100.0
      (value * 100).round.to_f / 100
    end
  end
end
