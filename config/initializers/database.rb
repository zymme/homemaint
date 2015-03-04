

MongoMapper.database = "homemaint-notes-#{Rails.env}"
MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
