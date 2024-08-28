class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post, :prefecture_id, :municipality, :street_address, :building_name, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
    validates :municipality
    validates :street_address
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "is invalid. Include only digits." }
  end

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Delivery.create(
      post: post,
      prefecture_id: prefecture_id,
      municipality: municipality,
      street_address: street_address,
      building_name: building_name,
      telephone: telephone,
      history_id: history.id
    )
  end


  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post, :prefecture_id, :municipality, :street_address, :building_name, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
    validates :municipality
    validates :street_address
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "is invalid. Include only digits." }
  end

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Delivery.create(
      post: post,
      prefecture_id: prefecture_id,
      municipality: municipality,
      street_address: street_address,
      building_name: building_name,
      telephone: telephone,
      history_id: history.id
    )
  end
end
