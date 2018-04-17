class Audit
  attr_reader :company
  def load_company(company)
    @company = company
  end
end