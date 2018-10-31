
{:ok, _} = Application.ensure_all_started(:hound)
ExUnit.start()

defmodule StepsDefinition do
  use WhiteBread.Context
  use ExUnit.Case
  require Commons
  require RegisterPage
  use Hound.Helpers

  Hound.start_session

  and_ ~r/^I do logoff$/, fn state ->
    RegisterPage.logoff
    {:ok, state}
  end

  and_ ~r/^I go to the Register Page$/, fn state ->
    RegisterPage.visit
    {:ok, state}
  end

  given_ ~r/^I navigate to "(?<url>[^"]+)"$/,
  fn state, %{url: url} ->
    Commons.visit url
    {:ok, state}
  end

  and_ ~r/^I submit form$/, fn state ->
    RegisterPage.submit
    {:ok, state}
  end

  and_ ~r/^I click on "(?<text>[^"]+)" to submit$/,
  fn state, %{text: text} ->
    Commons.click_on_submit text
    {:ok, state}
  end

  and_ ~r/^I click on "(?<text>[^"]+)"$/,
  fn state, %{text: text} ->
    Commons.click_on text
    {:ok, state}
  end

  and_ ~r/^I fill field Nome with value "(?<value>[^"]+)"$/,
  fn state, %{value: value} ->
    fill_field(RegisterPage.name, value)
    {:ok, state}
  end

  and_ ~r/^I fill field "(?<field>[^"]+)" with value "(?<value>[^"]+)"$/,
  fn state, %{field: field, value: value} ->
    Commons.fill_input(field, value, false)
    {:ok, state}
  end

  and_ ~r/^I fill field "(?<field>[^"]+)" with random value "(?<value>[^"]+)"$/,
  fn state, %{field: field, value: value} ->
    Commons.fill_input(field, value, true)
    {:ok, state}
  end

  and_ ~r/^I got registration successfully$/, fn state ->
    RegisterPage.check_successfully
    {:ok, state}
  end

  then_ ~r/^I take a screenshot$/, fn state ->
    take_screenshot("evidencia.png")
    delete_cookies()
    {:ok, state}
  end

end
