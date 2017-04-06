defmodule InstagramTest do
  use ExUnit.Case
  use ExUnit.Case
  use Hound.Helpers

  hound_session()
	
  @url "https://www.instagram.com/"

  def user do
    get_system("INSTAUSER")
  end

  def password do
    get_system("INSTAPASS")
  end

  defp get_system(var) do
    System.get_env(var)
  end

  test "Validates system variables" do
    assert user()
    assert password()
  end

  test "Should open Instagram web main page and user pager in multiple sessions" do
    navigate_to @url 
    change_session_to :user_page
    navigate_to "http://www.instagram.com/" <> user()
    refute current_url() == @url
    change_to_default_session()
    assert current_url() == @url
  end

  test "Given an user and password I should log in on Instagram web" do
    navigate_to @url
    username_input = find_element(:name, "username")
    fill_field(username_input, user())
    fill_field(find_element(:name, "password"), password())
    submit_element username_input
    find_element(:class, "_etslc")
  end

end
