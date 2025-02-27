class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show ]

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.includes(:customer, :invoice_items).all
    render json: @invoices, include: [ :customer, :invoice_items ]
  end

  # GET /invoices/1 or /invoices/1.json
  def show
    render json: @invoice
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.includes(:invoice_items, :customer).find(params[:id])
    end
end
