# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


<h1>Add new Friends to Group </h1>
<%= form_tag('/groups/update', :method => "post", id: "search-form") do %>
<%= text_field_tag :search, params[:search], placeholder: "Search Users",list:"usersEmails" %>
  <datalist id="usersEmails">

  <%= hidden_field_tag :id_friend, params[:id]  %>

  <%= select_tag :search,params[:search] %>
    <% @users.each do |useremail| %>
      <option value= "<%= useremail.email %>" ></option> 
    <% end %>
    </select>

  </datalist>
  <%= submit_tag "Search" ,:onclick => "return validateform()" %>
<% end %>
  
  
