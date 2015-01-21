json.array!(@homeitems) do |homeitem|
  json.extract! homeitem, :id, :name, :status, :stagetime, :userid, :desc
  json.url homeitem_url(homeitem, format: :json)
end
