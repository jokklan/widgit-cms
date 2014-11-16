module Widgit
  class Column < ActiveRecord::Base
    # Configuration
    default_scope { order(:position) }

    # Associations
    belongs_to :block, inverse_of: :columns
    belongs_to :tile, inverse_of: :columns

    # Validations
    validates :columns, :position, presence: true
  end
end
