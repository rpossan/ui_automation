defmodule Commons do
  use Hound.Helpers

  def host, do: "http://localhost:3000"

  # Navigate to any URL
  def visit(url) do
    navigate_to url
  end

  # Click on submit input
  def click_on_submit(text) do
    xpath = "//input[@type='submit' and @value='#{text}']"
    el = find_element(:xpath, xpath)
    el |> click()
  end

  # Click on element by the text
  def click_on(text) do
    el = find_element(:link_text, text)
    el |> click()
  end

  #Generic function to fill inputs
  def fill_input(field, value, rnd) do
    value =
      if rnd do
        now = NaiveDateTime.utc_now
        "#{value}#{now.hour}#{now.minute}"
      else
        value
      end
    xpath = "//input[@placeholder='#{field}']"
    el = find_element(:xpath, xpath)
    fill_field(el, value)
  end

end
