require 'minitest/autorun'
require 'minitest/pride'
require './lib/fileio'

class FileIoTest < Minitest::Test
  def test_it_exists
    fileio = FileIo.new
    assert_instance_of FileIo, fileio
  end

  def test_load_returns_csv_object
    assert_instance_of CSV, FileIo.load('./data/employees.csv')
  end
end