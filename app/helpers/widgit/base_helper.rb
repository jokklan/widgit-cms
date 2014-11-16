module Widgit
  module BaseHelper
    def target_id(record)
      record.id || (Time.now.to_f * 1000).round
    end
  end
end
