class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.csv{ send_data(get_csv, filename: "users-#{Time.now.strftime("%Y/%m/%d-%k_%M_%S")}.csv")}
      format.pdf{send_data(get_pdf, filename: "employees-#{Time.now.strftime("%Y/%m/%d-%k_%M_%S")}.pdf")}
    end
  end

  private

  def get_csv
    @users= User.select(:name, :email, :phone_number).limit(50).order(:name) 
    attributes = %w{name email phone_number}
    CSV.generate do |csv| 
      csv << attributes
      @users.each do |user| 
        csv << user.attributes.values_at(*attributes)
      end
    end
  end

  def get_pdf 
    @employees= Employee.select(:name, :email, :phone_number).limit(50).order(:name)
    pdf=Prawn::Document.new
    pdf.text("NAME \t EMAIL \t PHONE_NUMBER \n\n")
    @employees.each do |emp| 
      pdf.text("#{emp.name} \t #{emp.email} \t  #{emp.phone_number} \n")
    end
    pdf.render
  end

end
