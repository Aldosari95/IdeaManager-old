require 'test_helper'

class PlatformTest < ActiveSupport::TestCase

	def setup
		@platform = platforms(:one)
	end

	test "name should be present" do
		@platform.name = ""
		assert_not @platform.valid?
	end

	test "name should be unique" do
		duplicate_platform = @platform.dup
		duplicate_platform.name = @platform.name
		@platform.save
		assert_not duplicate_platform.valid?
	end

end
