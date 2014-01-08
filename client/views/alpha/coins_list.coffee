coinsData = [
  {name: 'Bitcoin', avg_value: 1000},
  {name: 'Litecoin', avg_value: 40}
]

###
TODO: Fix bug Template.coinsList is undefined.
It should be defined, and Template.coinItem is defined
Remove coins_list.js when problem is solved
###
Template.coinsList.helpers
  coins: @coinsData
