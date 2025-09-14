require 'sinatra'
require 'json'

RESPONSES = []

get '/' do
  <<-HTML
  <h1>Simple Survey Form</h1>
  <form action="/submit" method="post">
    <label>Name: <input name="name"></label><br>
    <label>Email: <input name="email"></label><br>
    <label>How did you hear about us?
      <select name="source">
        <option>Google</option>
        <option>Friend</option>
        <option>Advertisement</option>
        <option>Other</option>
      </select>
    </label><br>
    <input type="submit" value="Submit">
  </form>
  <hr>
  <h2>Responses</h2>
  <ul>
    #{RESPONSES.map { |r| "<li>#{r[:name]} (#{r[:email]}): #{r[:source]}</li>" }.join}
  </ul>
  HTML
end

post '/submit' do
  RESPONSES << { name: params[:name], email: params[:email], source: params[:source] }
  redirect '/'
end