class UrlsController < ApplicationController
  before_action :load_url, except: :create

  def create
    url = Url.build permit[:full]
    render plain: url.short
  end

  def show
    render plain: @url.resolve
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
