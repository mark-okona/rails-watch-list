class Bookmark < ApplicationRecord
  belongs_to :Movie
  belongs_to :List
end
