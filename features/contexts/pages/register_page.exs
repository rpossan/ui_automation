
defmodule RegisterPage do
  use Hound.Helpers

  @url "/users/sign_up"

  def visit do
    navigate_to "#{Commons.host}#{@url}"
  end

  defp get_input(label) do
    xpath = "//input[@placeholder='#{label}']"
    find_element(:xpath, xpath)
  end

  def submit do
    xpath = "//input[@type='submit' and @value='Inscrever-se']"
    el = find_element(:xpath, xpath)
    el |> click()
  end

  def email, do: get_input "Email"

  def password, do: get_input "Senha"

  def confirm_password, do: get_input "Confirmacao de Senha"

  def senha, do: get_input "Senha"

  def name, do: get_input("Nome*")

  def last_name, do: get_input "Sobrenome"

  def check_successfully_registration do

  end

end
