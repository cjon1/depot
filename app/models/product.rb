class Product < ActiveRecord::Base
  
  has_many :line_items
  has_many :orders, through: :line_items
  #...
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates_length_of :title, :minimum => 10, :too_short => "Must have at least 10 characters!" #did this work??
  validates :title, length: {minimum: 10, too_short: ": Your title is too short and you are too stupid. Moron." } 
  # NB - both of the above validations work! (ie they do the same thing slightly diff ways)
  
  private
  
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
  
  
end
