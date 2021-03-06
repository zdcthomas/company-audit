require 'minitest/autorun'
require 'minitest/pride'
require './lib/company'
require './lib/timesheet'
require './lib/employee'

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

  def test_load_employees_returns_success_hash
    company = Company.new
    good_employees = './data/employees.csv'
    loaded = company.load_employees(good_employees)
    assert_instance_of Hash, loaded
    assert loaded[:success]
    refute loaded[:error]
    refute company.employees.empty?
  end

  def test_load_bad_employees_returns_error_if_data_is_bad
    company = Company.new
    bad_employees = './data/bad_employees.csv'
    loaded = company.load_employees(bad_employees)
    assert_instance_of Hash, loaded
    refute loaded[:success]
    assert_equal 'bad data', loaded[:error]
    assert company.employees.empty?
  end

  def test_load_projects_returns_success_hash
    company = Company.new
    good_projects = './data/projects.csv'
    loaded = company.load_projects(good_projects)
    assert_instance_of Hash, loaded
    assert loaded[:success]
    refute loaded[:error]
    refute company.projects.empty?
  end

  def test_load_bad_projects_returns_error_if_data_is_bad
    company = Company.new
    bad_projects = './data/bad_projects.csv'
    loaded = company.load_projects(bad_projects)
    assert_instance_of Hash, loaded
    refute loaded[:success]
    assert_equal 'bad data', loaded[:error]
    assert company.projects.empty?
  end

  def test_load_timesheets_returns_success_hash
    company = Company.new
    good_timesheets = './data/timesheets.csv'
    loaded = company.load_timesheets(good_timesheets)
    assert_instance_of Hash, loaded
    assert loaded[:success]
    refute loaded[:error]
    refute company.timesheets.empty?
  end

  def test_load_bad_timesheets_returns_error_if_data_is_bad
    company = Company.new
    bad_timesheets = './data/bad_timesheets.csv'
    loaded = company.load_timesheets(bad_timesheets)
    assert_instance_of Hash, loaded
    refute loaded[:success]
    assert_equal 'bad data', loaded[:error]
    assert company.timesheets.empty?
  end

  def test_find_employee_by_id
    company = Company.new
    company.load_employees('./data/employees.csv')
    actual = company.find_employee_by_id(1)
    assert_instance_of Employee, actual
    assert_equal "Susan Smith", actual.name
    actual = company.find_employee_by_id(2)
    assert_instance_of Employee, actual
    assert_equal "John Smith", actual.name
  end

  def test_find_project_by_id
    company = Company.new
    company.load_projects('./data/projects.csv')
    actual = company.find_project_by_id(1)
    assert_instance_of Project, actual
    assert_equal 'Widgets', actual.name
    actual = company.find_project_by_id(2)
    assert_instance_of Project, actual
    assert_equal 'More Widgets', actual.name
  end

  def events
    company = Company.new
    company.load_projects('./data/projects.csv')
    company.load_timesheets('./data/timesheets.csv')
    company.load_employees('./data/employees.csv')
    actual = company.events
    assert_instance_of Hash, actual
  end

end
