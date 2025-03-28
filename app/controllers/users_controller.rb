class UsersController < ApplicationController
 def index
   matching_users = User.all


   @list_of_users = matching_users.order({:username => :asc})
  
   render({:template => "user_templates/index"})
 end

 def show
  #Parameters: {"path_username" => "anisa"}
  url_username = params.fetch("path_username")

  matching_users = User.where({:username => url_username})

  @the_user = matching_users.at(0)
  
  render({:template => "user_templates/show"})

 end

 def create
  input_username = params.fetch("input_username")

  new_user = User.new
  new_user.username = input_username

  new_user.save

  redirect_to("/users/#{new_user.username}")
end

def update
  the_id = params.fetch("path_id")
  the_user = User.find(the_id)

  input_username = params.fetch("input_username")

  the_user.username = input_username

  the_user.save

  redirect_to("/users/#{the_user.username}")
end


end
