require 'test_helper'

class RoleTest < ActiveSupport::TestCase

	def setup
		@role = roles(:one)
	end

	test "should be valid" do
		assert @role.valid?
	end

	test "name should be present" do
		@role.name = ""
		assert_not @role.valid?
	end

	test "name should be unique" do
		duplicate_role = @role.dup
		duplicate_role.name = @role.name
		@role.save
		assert_not duplicate_role.valid?
	end

end
