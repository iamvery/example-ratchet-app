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
        ],
        new_comment: {
          %{body: [name: "comment[body]"]},
          action: "#", method: "post",
        },
      },
      %{
        body: "Words",
        permalink: [href: "https://google.com"],
        comments: [
          "Capybara",
          "Wallaby",
        ],
        new_comment: {
          %{
            body: [name: "comment[body]"],
            submit: "Post it!",
          },
          action: "#", method: "post",
        },
      },
    ]

    render(conn, "index.html", data: %{articles: data})
  end
end
