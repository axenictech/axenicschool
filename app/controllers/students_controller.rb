class StudentsController < ApplicationController

def search_ajax
	@students=Student.where(:first_name=> params[:student][:first_name])

end

end
