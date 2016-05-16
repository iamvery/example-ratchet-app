defmodule RatchetApp.ArticleController do
  use RatchetApp.Web, :controller

  def index(conn, _params) do
    data = [
      %{
        "body" => "Thoughts and opinions!",
        "comments" => [
          "I also have thoughts.",
          "How do you even?",
        ]
      },
      %{
        "body" => "Words",
        "comments" => [
          "Capybara",
          "Wallaby",
        ]
      },
    ]

    {:ok, template} = File.read("web/templates/article/index.html")
    body = Ratchet.transform(template, "article", data)

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, body)
  end
end
