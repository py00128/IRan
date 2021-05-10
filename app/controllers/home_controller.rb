require 'rspotify'

class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:terms_and_conditions]

  def home
    require 'uri'
    require 'net/http'
    require 'openssl'
    require 'json'

    url = URI("https://quotes-inspirational-quotes-motivational-quotes.p.rapidapi.com/quote?token=ipworld.info")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = '0ec5e093f3mshff96e3b8fa106a4p171143jsn3c79520f5497'
    request["x-rapidapi-host"] = 'quotes-inspirational-quotes-motivational-quotes.p.rapidapi.com'

    response = http.request(request)
    @response = JSON.parse(response.read_body)

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

  def terms_and_conditions
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
