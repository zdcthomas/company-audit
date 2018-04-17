class Audit
  attr_reader :company
  def load_company(company)
    @company = company
  end


  def were_invalid_days_worked
    company.events
  end
    
end 