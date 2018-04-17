require 'minitest/autorun'
require 'minitest/pride'
require './lib/company'
require './lib/audit'

class AuditTest < Minitest::Test
  def test_it_exists
    audit = Audit.new
    assert_instance_of Audit, audit
  end

  def test_load_company
    audit = Audit.new
    company = Company.new
    company.load_employees('./data/employees.csv')
    company.load_projects('./data/projects.csv')
    company.load_timesheets('./data/timesheets.csv')
    actual = audit.load_company(company)
    assert_instance_of Company, actual
    assert_equal company, audit.company
  end

end