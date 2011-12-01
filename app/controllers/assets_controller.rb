class AssetsController < ApplicationController
  def index
    @assets = Asset.all
    render :json => @assets.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    @asset = Asset.new(params[:asset])
    if @asset.save
      render :json => [@asset.to_jq_upload].to_json
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
    render :json => true
  end
end
