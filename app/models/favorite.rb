class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :city

  def location
  end
end
