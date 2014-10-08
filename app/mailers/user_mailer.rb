class UserMailer < ActionMailer::Base
  default from: "axenicschool@gmail.com"

  def student_email(user,subject,message)
    @user = user
    @message=message
  	mail(to: @user.email, subject: "#{subject}")
  end
end
