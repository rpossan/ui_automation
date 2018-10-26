
{:ok, _} = Application.ensure_all_started(:hound)
ExUnit.start()

defmodule StepsDefinition do
  use WhiteBread.Context
  use ExUnit.Case
  require Page
  require RegisterPage

  Hound.start_session

  given_ ~r/^I navigate to "(?<url>[^"]+)"$/,
  fn state, %{url: _url} ->
    Page.visit _url
    {:ok, state}
  end

  and_ ~r/^I click on "(?<text>[^"]+)"$/,
  fn state, %{text: _text} ->
    Page.click_on _text
    {:ok, state}
  end

  and_ ~r/^I fill field "(?<field>[^"]+)" with random value "(?<value>[^"]+)"$/,
  fn state, %{field: _field,value: _value} ->
    RegisterPage.ronaldo(_field, _value)
    {:ok, state}
  end
end
