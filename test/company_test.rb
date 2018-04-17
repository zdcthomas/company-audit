require 'minitest/autorun'
require 'minitest/pride'
require './lib/company'

class CompanyTest < Minitest::Test
  def test_it_exists
    company = Company.new
    assert_instance_of Company, company
  end

  def test_it_has_attributes
    company = Company.new
    assert_equal [], company.employees
    assert_equal [], company.projects
    assert_equal [], company.timesheets
  end

  def test_load_employees_returns_hash
    company = Company.new
    filename = './data/employees.csv'
    assert_instance_of Hash, company.load_employees(filename)
  end
end