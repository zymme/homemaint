class Rctrun
  include MongoMapper::Document

  key :currentRunGuid, String
  key :previousRunGuid, String

  timestamps!

  # Validations
  validates_presence_of :currentRunGuid, :previousRunGuid

end
