require "test_helper"

class AvatarroTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert Avatarro::VERSION
  end

  test 'no exceptions' do
    assert_nothing_raised { Avatarro.svg("AA") }
    assert_nothing_raised { Avatarro.image("AA") }
  end
end
