class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[ show edit update destroy ]

  # GET /campaigns or /campaigns.json
  def index
    @campaigns = Campaign.all
    render json: @campaigns
  end

  # GET /campaigns/1 or /campaigns/1.json
  def show
    render json: @campaign
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
    render json: @campaign
  end

  # GET /campaigns/1/edit
  def edit
    render json: @campaign
  end

  # POST /campaigns or /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      render json: @campaign, status: :created, location: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campaigns/1 or /campaigns/1.json
  def update
    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1 or /campaigns/1.json
  def destroy
    @campaign.destroy
    render json: { message: "Campaign deleted" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
      params.expect(campaign: [ :name,  :points, :category_id ])
    end
end
