module Widgit
  class Column < ActiveRecord::Base
    include Positionable

    # Extensions
    positionable :block

    # Associations
    belongs_to :block, inverse_of: :columns
    belongs_to :tile, inverse_of: :columns

    # Validations
    validates :columns, presence: true
  end
end
