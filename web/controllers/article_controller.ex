defmodule RatchetApp.ArticleController do
  use RatchetApp.Web, :controller

  def index(conn, _params) do
    data = [
      %{
        body: "Thoughts and opinions!",
        permalink: {"Iamvery", href: "https://iamvery.com"},
        comments: [
          "I also have thoughts.",
          "How do you even?",
        ]
      },
      %{
        body: "Words",
        permalink: {"Google", href: "https://google.com"},
        comments: [
          "Capybara",
          "Wallaby",
        ]
      },
    ]

    render(conn, "index.html", data: %{articles: data})
  end
end
