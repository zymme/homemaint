class Homeitem < ActiveRecord::Base

  validates :userid, presence: true
  validates :desc, presence: true, length: { minimum: 5, maximum: 500, too_short: "must have at least %{count} characters" }

end
