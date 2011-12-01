class AssetsController < ApplicationController
  before_filter :fetch_asset
  
  def show
    send_file @asset.data.path, :type => @asset.data_content_type
  end

  protected
  def fetch_asset
    @asset = Asset.find params[:id]
  end
 end
