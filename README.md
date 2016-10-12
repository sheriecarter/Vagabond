# üTravel
Check out our app on <a href="https://stark-tundra-16200.herokuapp.com/"> Heroku
## Objective
Our goal was to create a travel application built on relationships. The application allows users to sign up, login, and create posts that are attributed to different cities in the database. Each city has posts attributed to the cities. The posts describe different user experiences  related to the city. The cities have a one to many relationship with posts and the users have a one to many relationship with posts. We wanted to create a splash/landing page that displayed the name of the website, with a call to action and the necessary log in/sign up buttons. We knew that user authorization and authentication was necessary to recognize existing users, prevent faulty users, and to prevent the general public from editing/deleting content. We also wanted to create administrative privileges so that we can ban an email or delete any user's content if it's offensive or abusive.   
## Technologies Used
-Ruby on Rails
-Bootstrap
-Puma(default server)
The front end and back end is built on Ruby on Rails, with Puma running Ruby's default server. We used Bootstrap for the front end framework and so that we could work off a grid system. It also made the nav bar more aesthetically pleasing.
## User Stories <br>
You can learn more about our user stories on <a href="https://trello.com/b/DGVH8EUT/vagabond">Trello</a>.
As a user, I want to be sign up.
As a user, I want to log in/log out.
As a user, I want to create posts that are attributed to cities.
As a user, I want to edit, update, and delete my posts.
As a user, I want to know that other users cannot edit/delete my information.
## Wireframe
https://github.com/sf-wdi-31/project-vagabond/blob/master/wireframes.png
## Control Flow
We made a new branch for each respective feature we built out. The idea of having a dev branch was difficult to stay in sync initially, but we ended up using scott-branch1 as our dev branch as a buffer between our feature branches and master. We had 35 branches total and over 100 commits. We had a few merge conflicts after the weekend that were tough to sort through but after that it was smooth sailing.
## Code Snippets (Code We're Proud Of!)
```Andrew
<div class="holder">
<h2> <%= @city.try(:name) %></h2>
  <center><%= image_tag @city.image, height: 500, width: 800 %></center><br>
    <% if current_user && admin %>
    <%= button_to 'Delete City', destroy_city_path(@city), method: :delete, data: {confirm: "Are you sure you want to delete #{ @city.name }?"}, class: "btn btn-danger" %>
    <% end %>
</div>
Nick
def admin
  current_user && current_user.admin
end
Sherie
class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
  validates :email, uniqueness:true
  Scott
Scott Whitman [12:21 PM]  
<% @city.posts.sort_by{|post| [post['updated_at']]}.reverse.each do |post| %>
 <h3> <%= link_to post.title, city_post_path(@city, post) %></h3>
 <h5> <strong>Posted by:</strong> <%= link_to User.find_by_id(post.user_id).name, user_path(post.user_id) %> </h5>
 <h5> <strong>Created:</strong> <%= post.created_at.localtime.to_formatted_s(:long_ordinal) %> </h5>
 <h5> <%= "Edited on " + post.updated_at.localtime.to_formatted_s(:long_ordinal) if post.updated_at.to_s != post.created_at.to_s %> </h5>
 <h4> <em><%= post.body.length > 180 ? post.body[0,180] << "..." : post.body %></em> </h4>
 <% end %>
end
```
