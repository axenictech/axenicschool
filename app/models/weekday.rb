class Weekday < ActiveRecord::Base
  belongs_to :batch
  scope :shod, ->(id) { where(id: id).take }
   scope :batchid, ->(b) { where(batch_id: b.id) }
  def self.deleteweek(w)
  	 unless w.nil?
        w.destroy_all
      end
    w
  end

  def self.saveweek(w,d,b)
  	 w.each  do |wa|
      divas = d[wa.to_i]
     weekday = Weekday.new(batch_id: b.id, weekday: divas)
       weekday.save
     end
  end
end
