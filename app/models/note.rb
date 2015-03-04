class Note
  include MongoMapper::Document

  key :title, String
  key :url, String
  key :note, String
  key :username, String
  key :guid, String

  timestamps!

  # Validations
  validates_presence_of :title, :url, :note, :username



end
