module SpreeGroupPromo
  class Engine < Rails::Engine
    engine_name 'spree_group_promo'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree.promo.register.promotions.rules" do |app|
      app.config.spree.promotions.rules += [Spree::Promotion::Rules::ProductBuyGroupTotal]
    end

    initializer 'spree.promo.register.group_calculators', :after => "spree.promo.register.promotion.calculators"  do |app|
      app.config.spree.calculators.promotion_actions_create_adjustments += [Spree::Calculator::FlatPercentGroupTotal]
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
