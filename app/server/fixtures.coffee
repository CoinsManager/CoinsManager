"""
Initial data:

  → set a default user CoinsManager
  - create its donation addresses
"""

coinsManager = Meteor.users.findOne
  "emails.address": Meteor.settings.public.email

if coinsManager
  Addresses.remove
    userId: coinsManager._id
  Meteor.users.remove
    _id: coinsManager._id

# Create CoinsManager account
coinsManagerId = Accounts.createUser
  email: Meteor.settings.public.email
  profile:
    favorites:
      fiat: "USD"

# Add public addresses for CoinsManager
for name, data of Meteor.settings.public.donations
  options =
    userId: coinsManagerId
    name: name
    address: data.address
  if "balance" of data
    options.balance = data.balance
  if "value" of data
    options.value = data.value
  if "code" of data
    options.code = data.code
  Addresses.insert options
