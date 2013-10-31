class DaysPickerController < ApplicationController

	def index
		p "hee"
		@user = 'Weekdays.by_year(2012)'
	end


	def by_year
		@type = params[:type]
		@year = params[:year]
		@dates = eval(@type).by_year(@year.to_i)
		@count = @dates.count
		@data = {count: @count, type: @type, year: @year, dates: @dates}
		respond_to do |format|
           format.js 
	   end
	end

	def by_year_and_month
		@type = params[:type]
		@year = params[:year]
		@month = params[:date][:month]
		@dates = eval(@type).by_year_and_month(@year.to_i,@month.to_i)
		@count = @dates.count
		@data = {count: @count, type: @type, year: @year, dates: @dates,month: @month}
		respond_to do |format|
           format.js 
	   end
	end

end
