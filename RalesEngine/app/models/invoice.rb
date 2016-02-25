class Invoice < ActiveRecord::Base

  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  scope :successful, -> { joins(:transactions).where("result = 'success'") }
  scope :failed, -> { joins(:transactions).where("result = 'failed'") }
  scope :select_date, ->(date) { where("extract(month from created_at) = ? and extract(day from created_at) = ?", date.month, date.day) }

  def self.find_all_by_customer_id(params)
    where(customer_id: params[:customer_id])
  end

  def self.find_all_by_merchant_id(params)
    where(merchant_id: params[:merchant_id])
  end

  def self.find_all_by_status(params)
    where('LOWER(status) = ?', params[:status].downcase)
  end

  def self.find_all_by_created_at(params)
    where(created_at: params[:created_at])
  end

  def self.find_all_by_updated_at(params)
    where(updated_at: params[:updated_at])
  end

  def self.find_all_by_id(params)
    where(id: params[:id])
  end

  def self.find_by_customer_id(params)
    find_by(customer_id: params[:customer_id])
  end

  def self.find_by_merchant_id(params)
    find_by(merchant_id: params[:merchant_id])
  end

  def self.find_by_status(params)
    find_by('LOWER(status) = ?', params[:status].downcase)
  end

  def self.find_by_created_at(params)
    find_by(created_at: params[:created_at])
  end

  def self.find_by_updated_at(params)
    find_by(updated_at: params[:updated_at])
  end

  def self.find_by_id(params)
    find(params[:id]) if params[:id]
  end
end
