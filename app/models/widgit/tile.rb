module Widgit
  class Tile < ActiveRecord::Base
    # Associations
    has_many :columns, inverse_of: :block
    has_many :blocks, through: :columns
    has_many :components, inverse_of: :tile
  end
end
