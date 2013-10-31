class DaysPickerController < ApplicationController

	def index
	
	end


	def by_year
		@type = params[:type]
		@year = params[:year].to_i
		@dates = eval(@type).by_year(@year)
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
		@formatted_dates = @dates.collect {|i| i.strftime('%d-%b-%Y')}.join(', ')
		@count = @dates.count
		@data = {count: @count, type: @type, year: @year, dates: @formatted_dates,month: @month}
		respond_to do |format|
           format.js 
	   end
	end

end
