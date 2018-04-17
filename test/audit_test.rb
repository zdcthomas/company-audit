require 'minitest/autorun'
require 'minitest/pride'
require './lib/audit'

class AuditTest < Minitest::Test
  def test_it_exists
    audit = Audit.new
    assert_instance_of Audit, audit
  end
end