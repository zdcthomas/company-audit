require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def test_instantiation
    employee_id = '5'
    name = 'Sally Jackson'
    role = 'Engineer'
    start_date = '2015-01-01'
    end_date = '2018-01-01'
    employee = Employee.new(employee_id, name, role, start_date, end_date)
    assert_instance of Employee, employee
  end

  def test_attributes
  end
end
