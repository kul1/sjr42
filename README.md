teps to reproduce
Create a new Rails app:

rails new sjr-test
cd sjr-test
rake db:create db:migrate
Add the following files:

# config/routes.rb
Rails.application.routes.draw do
  resources :sjrs, only: [:new, :create]
end
# app/controllers/sjrs_controller.rb
class SjrsController < ApplicationController
  def new
  end

  def create
  end
end
# app/views/sjrs/new.html.erb
<%= button_to "Create SJR", sjrs_path, remote: true %>
# app/views/users/create.js.erb
alert("SJR is working!")
Then:

Start the server
Visit http://localhost:3000/sjrs/new
Click on the "Create SJR" button
Expected behavior
You should see a JavaScript alert saying "SJR is working!".

Actual behavior
No alert is shown and Server-generated JavaScript Response isn't executed because of Content Security Policy. This is the error from JavaScript console:

rails-ujs.self-9d0f3ce06afecd4183b5a50580cd7617b5e10fba48d12d3cf53668539f4d77db.js:244 Refused to execute inline script because it violates the following Content Security Policy directive: "script-src 'self' https:". Either the 'unsafe-inline' keyword, a hash ('sha256-djTI7ayTUPgKSs+qoOHPSkHb3BZ3yW1FOMkS7/k/vzw='), or a nonce ('nonce-...') is required to enable inline execution.
System configuration
Rails version: 5.2.0.beta2

Ruby version: 2.4.1p111

