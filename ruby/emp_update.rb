require 'rbygem'
require 'mongo'

$client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'test')
Mongo::Logger.logger.level = ::Logger::ERROR
$emp = $client[:emp]
puts 'connected!'

$emp.find({"deptno"=>30}).update_many({"$set" => {"deptno" => 40}})

cursor = $emp.find()
cursor.each do |doc|
	puts doc
end
