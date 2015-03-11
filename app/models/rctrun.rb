class Rctrun
  include MongoMapper::Document

  key :currentRunGuid, String
  key :previousRunGuid, String
  key :policy_num, String
  key :claim_num, String

  timestamps!

  # Validations
  validates_presence_of :currentRunGuid, :previousRunGuid

end
