
{:ok, _} = Application.ensure_all_started(:hound)
ExUnit.start()

defmodule StepsDefinition do
  use WhiteBread.Context
  use ExUnit.Case
  require Commons
  require RegisterPage

  Hound.start_session

  given_ ~r/^I navigate to "(?<url>[^"]+)"$/,
  fn state, %{url: _url} ->
    Commons.visit _url
    {:ok, state}
  end

  and_ ~r/^I click on "(?<text>[^"]+)"$/,
  fn state, %{text: _text} ->
    Commons.click_on _text
    {:ok, state}
  end

  and_ ~r/^I fill field "(?<field>[^"]+)" with value "(?<value>[^"]+)"$/,
  fn state, %{field: _field, value: _value} ->
    Commons.fill_input(_field, _value)
    {:ok, state}
  end

  and_ ~r/^I fill field "(?<field>[^"]+)" with random value "(?<value>[^"]+)"$/,
  fn state, %{field: _field, value: _value} ->
    Commons.fill_input(_field, _value, true)
    {:ok, state}
  end

end
