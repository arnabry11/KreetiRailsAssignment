class HomeController < ApplicationController
  
  def index
    respond_to do |format|
      format.html
      format.csv{ send_data(get_csv, filename: "users-#{Time.now.strftime("%Y/%m/%d-%k_%M_%S")}.csv")}
      format.pdf{ send_data(get_pdf, filename: "employees-#{Time.now.strftime("%Y/%m/%d-%k_%M_%S")}.pdf")}
    end
  end

  def send_email 
    @students= User.select(:name, :email, :phone_number).limit(50).order(:name)
    AssignmentMailer.assignment_email("rarnab021@gmail.com", @students).deliver
    flash[:notice] = "You have sent an email."
    redirect_to root_path
  end

  private

  def get_csv
    @users= User.select(:name, :email, :phone_number).limit(50).order(:name) 
    @users.to_csv
  end

  def get_pdf 
    @employees = Employee.select(:name, :email, :phone_number).limit(50).order(:name)
    pdf = EmployeePdf.new(@employees)
    pdf.render
  end

end
