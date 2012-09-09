{classify} = require '../index'

options =
  classifications: './classifications'
  transcripts: './transcripts'

classify options, (classification, transcript) ->
  console.log "#{classification} bullshit detected in #{transcript}."
