class RestaurantPizzaSerializer < ActiveModel::Serializer
  has_many :pizzas
  attributes :name, :id, :address
  

end
