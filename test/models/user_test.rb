require "test_helper"

class UserTest < ActiveSupport::TestCase
	test "name" dp
		assert_equal "Accountant", users(:accountant).name
	end
end
