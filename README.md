SpreeGroupPromo
===============

This gem adds a Promotion to Spree that allows you to run a promo on products within a certain group. So for example, if you had a group with the following items:

Cool Tshirts
```
Rails Tshirt
RailsDog Tshirt
```

You could have a promo that said something like "if you buy over $100 in cool tshirts, get 10% off of them".

There are two parts - the promotion, and the calculator. These can be used separately, or together. The calculator lets you create an adjustment for "10% off of desserts", as opposed to the regular flat percent calculator that will let you have "10% off".

To use, just add to your gemfile:

`gem 'spree_group_promo', :git => 'git://github.com/angelim/spree_group_promo'`

## Contributors
- Greg Reinacker
- Scott Wagner

## License

Copyright (c) 2012 Greg Reinacker, released under the New BSD License
