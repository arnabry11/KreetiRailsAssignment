class HomeController < ApplicationController
  
  def index
    respond_to do |format|
      format.html
      format.csv{ send_data(get_csv, filename: "users-#{Time.now.strftime("%Y/%m/%d-%k_%M_%S")}.csv")}
      format.pdf{ send_data(get_pdf, filename: "employees-#{Time.now.strftime("%Y/%m/%d-%k_%M_%S")}.pdf")}
    end
  end

  def send_email 
    @students= get_50_records("Student")
    AssignmentMailer.assignment_email("rarnab021@gmail.com", @students).deliver
    flash[:notice] = "You have sent an email."
    redirect_to root_path
  end

  private

  def get_50_records(model_name)
    return model_name.constantize.select(:name, :email, :phone_number).limit(50).order(:name)
  end

  def get_csv
    @users= get_50_records("User")
    @users.to_csv
  end

  def get_pdf 
    @employees = get_50_records("Employee")
    pdf = EmployeePdf.new(@employees)
    pdf.render
  end

end
