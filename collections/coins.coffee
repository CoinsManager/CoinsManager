class BaseCoin

  constructor: (@attributes) ->


class @Bitcoin extends BaseCoin


@Coins = new Meteor.Collection 'coins'

exports.BaseCoin = Model unless Meteor?

Posts = new Meteor.Collection 'posts'
