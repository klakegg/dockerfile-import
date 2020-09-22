# Loading library
Dir["#{__dir__}/instruction/*.rb"].each { |file| require file }
Dir["#{__dir__}/model/*.rb"].each { |file| require file }
