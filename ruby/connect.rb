require 'rbygem'
require 'mongo'

$client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'test')
Mongo::Logger.logger.level = ::Logger::ERROR
$users = $client[:users]
puts 'connected!'
