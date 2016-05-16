defmodule RatchetApp.ArticleTransform do
  def init(action) do
    action
  end

  def call(conn, action) do
    IO.inspect action
    apply(__MODULE__, action, [conn])
  end

  def index(conn) do
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
    |> Plug.Conn.put_resp_content_type("text/html")
    |> Plug.Conn.send_resp(200, body)
  end
end
