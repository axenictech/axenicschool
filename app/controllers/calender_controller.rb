class CalenderController < ApplicationController
 
 def index
  if params[:new_month].nil?
      @show_month = Date.today
    else
      d = params[:new_month].to_i
      passed_date = (params[:passed_date]).to_date
      if params[:new_month].to_i > passed_date.month
        @show_month  = passed_date+1.month
      else
        @show_month = passed_date-1.month
      end      
    end    
    @start_date = @show_month.beginning_of_month
    @start_date_day = @start_date.wday
    @last_day = @show_month.end_of_month


 end

 def demo
end

def next
   @show_month = Date.today

   @show_month=params[:next].to_date
  
end

def holiday_event_view
    @event=Event.find(params[:event_id])

end

end