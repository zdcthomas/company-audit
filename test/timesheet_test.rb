require 'minitest/autorun'
require 'minitest/pride'
require './lib/timesheet'

class TimesheetTest < Minitest::Test
  def test_it_exists
    employee_id = '5'
    project_id = '7'
    date = '2015-01-01'
    minutes = '120'
    timesheet = Timesheet.new(employee_id, project_id, date, minutes)
    assert_instance_of Timesheet, timesheet
  end
end