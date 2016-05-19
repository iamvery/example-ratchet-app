defmodule RatchetApp.ArticleController do
  use RatchetApp.Web, :controller

  def index(conn, _params) do
    data = [
      %{
        body: "Thoughts and opinions!",
        comments: [
          "I also have thoughts.",
          "How do you even?",
        ]
      },
      %{
        body: "Words",
        comments: [
          "Capybara",
          "Wallaby",
        ]
      },
    ]

    render(conn, "index.html", data: %{articles: data})
  end
end
