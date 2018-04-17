require 'minitest/autorun'
require 'minitest/pride'
require './lib/project'

class ProjectTest < Minitest::Test
  def test_it_exists
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')
    assert_instance_of Project, project
  end
end