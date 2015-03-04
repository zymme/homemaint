class Hitem
  include MongoMapper::Document

  key :hitem_id, String
  key :name, String
  key :status, String
  key :stagetime, Time
  key :userid, String
  key :desc, String
  key :guid, String
  key :created_at, Time
  key :updated_at, Time


  def == (comparison_object)

    self.hitem_id == comparison_object.hitem_id || self.name == comparison_object.name ||
    self.status == comparison_object.status 

  end


end
