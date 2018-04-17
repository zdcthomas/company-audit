require 'minitest/autorun'
require 'minitest/pride'
require './lib/fileio'

class FileIoTest < Minitest::Test
  def test_it_exists
    fileio = FileIo.new
    assert_instance_of FileIo, fileio
  end
end