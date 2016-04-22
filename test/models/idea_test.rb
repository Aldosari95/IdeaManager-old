require 'test_helper'

class IdeaTest < ActiveSupport::TestCase

	def setup
		@idea = ideas(:one)
	end

	test "should be valid" do
		assert @idea.valid?
	end

	test "name should be present" do
		@idea.name = ""
		assert_not @idea.valid?
	end

	test "description should be present" do
		@idea.description = ""
		assert_not @idea.valid?
	end

	test "additional_info should be present" do
		@idea.additional_info = ""
		assert_not @idea.valid?
	end

	test "platform_id should be present" do
		@idea.platform_id = ""
		assert_not @idea.valid?
	end

end
