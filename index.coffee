{readDir, readText} = require './lib/utilities'
natural = require 'natural'
module.exports = @

classifier = new natural.BayesClassifier()
classifications = []


classifyTranscripts = (transcripts, callback) ->
  readDir(transcripts).forEach (transcript) ->
    callback?(classifier.classify(readText("#{transcripts}/#{transcript}")), transcript)


setClassifications = (classifications) ->
  readDir(classifications).forEach (file) ->
    classification = file.split('.')[0]
    classifier.addDocument readText("#{classifications}/#{file}").split(', '), classification


@classify = (options, callback) ->
  setClassifications options.classifications
  classifier.train()
  classifyTranscripts options.transcripts, callback
