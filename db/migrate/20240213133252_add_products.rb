class AddProducts < ActiveRecord::Migration[7.1]
  def change
    Product.create :title => 'Hawaiian',
                  :description => 'This is Hawaiian pizza',
                  :price => 350,
                  :size => 30,
                  :is_spicy => false,
                  :is_veg => false,
                  :is_best_offer => false,
                  :path_to_image => '/images/hawaiian.jpeg'

    Product.create :title => 'Pepperoni',
                   :description => 'Nice Pepperoni pizza',
                  :price => 450,
                  :size => 30,
                  :is_spicy => false,
                  :is_veg => false,
                  :is_best_offer => false,
                  :path_to_image => '/images/pepperoni.jpeg'

    Product.create :title => 'Vegetarian',
                  :description => 'AmazingVegetarian pizza',
                  :price => 400,
                  :size => 30,
                  :is_spicy => false,
                  :is_best_offer => false,
                 :path_to_image => '/images/veg.jpeg'
  end
end
