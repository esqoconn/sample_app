MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "#sample_app-#{Rails.env}"

if defined?(PhusionPassenger)
  PhusionPassenger.on_evt(:starting_worker_process) do |forked|
    MongoMapper.connection.connect if forked
    end
  end
