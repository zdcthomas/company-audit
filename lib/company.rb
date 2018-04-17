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
      employee_id = timesheet[0]
      project_id = timesheet[1]
      start_date = timesheet[2]
      minutes = timesheet[3]
      if employee_id && project_id && start_date && minutes
        temp_timesheets << Timesheet.new(employee_id, project_id, start_date, minutes)
      else
        return report(false,'bad data')
      end
    end
    temp_timesheets.each{|timesheet|@timesheets << timesheet}
    return report(true)
  end

  def find_employee_by_id(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  def find_project_by_id(id)
    @projects.find do |project|
      project.id == id
    end
  end

  def events
    events = []
    @timesheets.each do |timesheet|
      event[:employee] = find_by_employee_id(timesheet.employee_id)
      event[:project] = find_by_project_id(timesheet.project_id)
      event[:date] = timesheet.date
      event[:minutes] = timesheet.minutes
      events << event
    end
    events
  end


  def report(success, error_type = nil)
    {success: success, error: error_type}
  end

end