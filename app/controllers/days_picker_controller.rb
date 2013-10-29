class DaysPickerController < ApplicationController

	def index
		p "hee"
		@user = 'Weekdays.by_year(2012)'
	end

	def create
	  year = params[:year].to_i
	  @data = DaysPicker.fetch_for(year)
	  p @data
       respond_to do |format|
       format.js
  
	   end
	end
end
