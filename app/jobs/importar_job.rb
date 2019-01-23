require 'csv'
require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/mysql2_adapter'
class ImportarJob < ProgressJob::Base
    def perform
        ruta ="E:/Db/1-xvideos.com-db.csv"
        videos=[]
        maximo = CSV.foreach(ruta, { :col_sep => ";", :headers => true, :liberal_parsing => true }).count
        update_progress_max(maximo)
        CSV.foreach(ruta, { :col_sep => ";", :headers => true, :liberal_parsing => true }) do |row|
                videos << Xvideo.new(:url => row[0], :name => row[1], :duration => row[2], :img => row[3], :iframe => row[4], :tag => row[5], :number => row[6], :category => row[7])
                if videos.length == 500
                    Xvideo.cargar_csv(videos)
                    videos=[]
                    500.times do |x|
                        update_progress
                    end
                end
                
        end
    end
end