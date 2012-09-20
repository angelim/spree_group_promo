# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_group_promo'
  s.version     = '1.0.0'
  s.summary     = 'Shameless copy of spree_taxon_promo, but for promotions based on the amount of purchase from products in a group'
  s.description = ''
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'Greg Reinacker, Alexandre Angelim'
  s.email     = 'gregr@rassoc.com, angelim@angelim.com.br'
  s.homepage  = 'http://www.rassoc.com'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 1.0.0'

end
