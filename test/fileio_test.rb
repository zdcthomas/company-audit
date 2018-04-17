require 'minitest/autorun'
require 'minitest/pride'
require './lib/fileio'

class FileIoTest < Minitest::Test
  def test_it_exists
    fileio = FileIo.new
    assert_instance_of FileIo, fileio
  end

  def test_load_returns_csv_object
    assert_instance_of CSV, FileIo.load('/Users/zacharythomas/turing/1module/week_6/day_28/final_timed_assessment/company-audit/data/employees.csv')
  end
end