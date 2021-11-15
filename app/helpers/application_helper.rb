module ApplicationHelper
    # assist with displaying the date
    def verbose_date(date)
		date.strftime('%B %d %Y')
	end
end
