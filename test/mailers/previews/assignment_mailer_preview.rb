# Preview all emails at http://localhost:3000/rails/mailers/assignment_mailer
class AssignmentMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    @students= User.select(:name, :email, :phone_number).limit(50).order(:name)
    AssignmentMailer.assignment_email("rarnab021@gmail.com",@students)
  end
end
