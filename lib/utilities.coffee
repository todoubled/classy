fs = require 'fs'
module.exports = @

cleanString = (text) -> text.toString().toLowerCase().replace /^\s+|\s+$/g, ""
readFile = (path) -> fs.readFileSync path, 'utf8'
@readDir = (path) -> fs.readdirSync path
@readText = (file) -> cleanString readFile file
