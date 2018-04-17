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
    good_employees = './data/employees.csv'
    loaded = company.load_employees(good_employees)
    assert_instance_of Hash, loaded
    assert loaded[:success]
    refute loaded[:error]
    refute company.employees.empty?
  end

  def test_load_returns_error_if_data_is_bad
    company = Company.new
    bad_employees = './data/bad_employees.csv'
    loaded = company.load_employees(bad_employees)
    assert_instance_of Hash, loaded
    refute loader[:success]
    assert_eqaul 'bad data', loaded[:error]
    assert company.employees.empty?
  end
end