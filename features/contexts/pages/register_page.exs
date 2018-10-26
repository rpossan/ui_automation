
defmodule RegisterPage do
  use Hound.Helpers
  def ronaldo(field, value) do
    value = "#{value}#{NaiveDateTime.utc_now}"
    xpath = "//input[@placeholder='#{field}']"
    el = find_element(:xpath, xpath)
    fill_field(el, value)
  end
end
