defmodule Commons do
  use Hound.Helpers

  # Navigate to any URL
  def visit(url) do
    navigate_to url
  end

  # Click on element by the text
  def click_on(text) do
    el = find_element(:link_text, text)
    el |> click()
  end

  #Generic function to fill inputs
  def fill_input(field, value, rnd) do
    now = NaiveDateTime.utc_now
    value = if rnd, do: "#{value}#{now.hour}#{now.minute}"
    xpath = "//input[@placeholder='#{field}']"
    el = find_element(:xpath, xpath)
    fill_field(el, value)
  end

end
