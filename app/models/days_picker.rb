class DaysPicker
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :year, :type,:month
  
  validates_presence_of :year
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def self.fetch_for(year)
  	hsh = HashWithIndifferentAccess.new
  	hsh[:weekdays] = Weekdays.by_year(year).count.to_s
  	hsh[:sundays] = Sundays.by_year(year).count.to_s
  	hsh[:mondays] = Mondays.by_year(year).count.to_s
  	hsh[:tuesdays] = Tuesdays.by_year(year).count.to_s
  	hsh[:wednesdays] = Wednesdays.by_year(year).count.to_s
  	hsh[:thursdays] = Thursdays.by_year(year).count.to_s
  	hsh[:fridays] = Fridays.by_year(year).count.to_s
  	hsh[:saturdays] = Saturdays.by_year(year).count.to_s
  	hsh
  end

  def persisted?
    false
  end
end