# Check that the userId specified owns the documents
@ownsDocument = (userId, doc) ->
  doc and doc.userId is userId
