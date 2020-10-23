class UrlsController < ApplicationController
  before_action :load_url, except: :create

  def create
    url = Url.new permit
    url.short = SecureRandom.uuid[0..5]
    url.save
    render plain: url.short
  end

  def show
    @url.count += 1
    @url.save
    render plain: @url.full
  end

  def stat
    render plain: @url.count
  end

  private

  def permit
    params.permit(:full)
  end

  def load_url
    @url = Url.find_by short: params[:short_url]
  end

end
