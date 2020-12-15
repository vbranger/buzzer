class Game < ApplicationRecord
has_many :buzzs, dependent: :destroy
end
