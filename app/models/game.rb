class Game < ApplicationRecord
  has_many :buzzs, dependent: :destroy
  
  def winner_id
    unless self.buzzs.empty?
      return self.buzzs.first.user.id
    else
      return ""
    end
  end
end
