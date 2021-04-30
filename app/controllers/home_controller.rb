require 'rspotify'

class HomeController < ApplicationController
  def home
    RSpotify.authenticate("c2cc5da67aaa434aafe3a7436867e0dc", "f9e2653ee192439286af48f294c85dfc")
    playlist = RSpotify::Playlist.find('Spotify', '37i9dQZF1DWZUTt0fNaCPB')
    @tracks = playlist.tracks.sample(8)
    @messages = Message.last(50)
    @message = Message.new

    @runs = current_user.runs
    @currentRun = Run.find(params[:run_id])
    @startingPoint = @currentRun.starting_point
    @destination = @currentRun.destination
    rescue ActiveRecord::RecordNotFound
      @startingPoint = "University of Surrey"
      @destination = "Manor Park"
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      # Send an email
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end

    redirect_to root_path
  end
end
