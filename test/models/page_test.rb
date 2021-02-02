require "test_helper"

class PageTest < ActiveSupport::TestCase
  setup do
    @profile = profiles(:admin)
  end

  test "can be only one active" do
    @profile.pages.first.update!(active: true)
    new_page = @profile.pages.new(active: true)
    assert_not(new_page.valid?)

    @profile.pages.update_all(active: false)
    assert(new_page.valid?)
  end
end
