require 'watir'
require 'rspec/expectations'
require 'pry'

def login(team, email, password)
  @b.goto 'slack.com'
  @b.a(class: 'opt_cta_signin').click
  @b.input(id: 'domain').send_keys team
  @b.button(id: 'submit_team_domain').click
  @b.text_field(id: 'email').send_keys email
  @b.text_field(id: 'password').send_keys password
  @b.button(id: 'signin_btn').click
end


def logged_in?(username)
  @b.span(id: 'team_menu_user_name').text == username
end


def logout
  @b.div(id: 'team_menu').click
  @b.li(id: 'logout').click 
end


def logged_out?
  @b.h1.text == "You’ve signed out of Slack"
end


def create_channel(title,  private, purpose = nil)
  @b.button(class: 'new_channel_btn').click
  @b.span(class: 'ts_toggle_handle').click if private
  @b.input(id: 'channel_create_title').send_keys title
  @b.input(id: 'channel_purpose_input').send_keys purpose
  @b.button(id: 'save_channel').click
end

def send_msg(message)
  @b.textarea(id: 'msg_input').send_keys(message)
  @b.textarea(id: 'msg_input').send_keys("\n")
end
    

def channel_invite(username)
  @b.input(id: 'channel_invite_filter').send_keys username
  @b.div(class: 'channel_invite_row').click
end






