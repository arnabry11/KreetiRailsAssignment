class EmployeePdf  < Prawn::Document

  def initialize(employees)
    super() 
    @employees = employees
    write_lines
  end

  def write_lines 
    table([["NAME", "EMAIL", "PHONE_NUMBER"]], cell_style: { min_font_size: 8, width: 180 })
    @employees.each do |emp| 
      table([["#{emp.name}", "#{emp.email}", "#{emp.phone_number}"]], cell_style: { min_font_size: 8, width: 180 })
    end
  end
  
end