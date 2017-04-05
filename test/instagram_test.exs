defmodule InstagramTest do
	use ExUnit.Case
	use ExUnit.Case
	use Hound.Helpers

	hound_session()

	test "Should open Instagram web in multiple sessions" do
		url = "https://www.instagram.com"
		navigate_to(url)

		change_session_to :another

		navigate_to(url)

		assert url == current_url()

		change_to_default_session()

		assert url == current_url()
	end

end
