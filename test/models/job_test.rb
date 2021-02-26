require "test_helper"

class JobTest < ActiveSupport::TestCase
  test "scope:current" do
    current = jobs(:current)
    assert_equal(current, Job.current)
  end
end
