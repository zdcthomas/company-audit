require_relative '../modules/date_handler'
require_relative './employee'
require_relative './project'
require_relative './fileio'
require 'pry'
class Company
  attr_reader :employees,
              :projects,
              :timesheets
  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(path)
    csv_read = FileIo.load(path)
    temp_employess = []
    csv_read.each do |employee|
      id = employee[0]
      name = employee[1]
      role = employee[2]
      start_date = employee[3]
      end_date = employee[4]
      if id && name && role && start_date && end_date
        temp_employess << Employee.new(id, name, role, start_date, end_date)
      else
        failed = true
        return report(false,'bad data')
      end
    end
    temp_employess.each{|employee|@employees << employee}
    return report(true)
  end

  def load_projects(path)
    csv_read = FileIo.load(path)
    temp_projects = []
    csv_read.each do |project|
      id = project[0]
      name = project[1]
      start_date = project[2]
      end_date = project[3]
      if id && name && start_date && end_date
        temp_projects << Project.new(id, name, start_date, end_date)
      else
        failed = true
        return report(false,'bad data')
      end
    end
    temp_projects.each{|project|@projects << project}
    return report(true)
  end

  def load_timesheets(path)
    csv_read = FileIo.load(path)
    temp_timesheets = []
    csv_read.each do |timesheet|
      id = timesheet[0]
      name = timesheet[1]
      start_date = timesheet[2]
      end_date = timesheet[3]
      if id && name && start_date && end_date
        temp_timesheets << Timesheet.new(id, name, start_date, end_date)
      else
        failed = true
        return report(false,'bad data')
      end
    end
    temp_timesheets.each{|timesheet|@timesheets << timesheet}
    return report(true)
  end


  def report(success, error_type = nil)
    {success: success, error: error_type}
  end

end