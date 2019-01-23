require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/mysql2_adapter'
class Xvideo < ApplicationRecord
    def self.cargar_csv(videos)
        Xvideo.import videos, recursive: true
    end
end
