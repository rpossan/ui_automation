defmodule Page do
  use Hound.Helpers
  def visit(url) do
    navigate_to url
  end

  def click_on(text) do
    el = find_element(:link_text, text)
    el |> click()
  end
end
