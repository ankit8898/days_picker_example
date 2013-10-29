class DaysPicker
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :year
  
  validates_presence_of :year
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def self.fetch_for(year)
  	hsh = HashWithIndifferentAccess.new
  	hsh[:weekdays] = Weekdays.by_year(year).count
  	hsh[:sundays] = Sundays.by_year(year).count
  	hsh[:mondays] = Mondays.by_year(year).count
  	hsh[:tuesdays] = Tuesdays.by_year(year).count
  	hsh[:wednesdays] = Wednesdays.by_year(year).count
  	hsh[:thursdays] = Thursdays.by_year(year).count
  	hsh[:fridays] = Fridays.by_year(year).count
  	hsh[:saturdays] = Saturdays.by_year(year).count
  	hsh
  end

  def persisted?
    false
  end
end