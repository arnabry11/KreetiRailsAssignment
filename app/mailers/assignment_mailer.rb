class AssignmentMailer < ApplicationMailer

  default from: "rarnab021@gmail.com"

  def assignment_email(recipient, students)
    @students=students 
    mail(to: recipient, subject: 'Student Record')
  end

end
