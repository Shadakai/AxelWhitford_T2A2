Listing.destroy_all 

User.create!(name: 'Axel Whitford', email: 'realemail@email.com', password: 'password',id: 1)

Listing.create!(title: 'Weak Health Potion', description: 'A standard potion for healing your health.', price: 20 , user_id: 1)
Listing.create!(title: 'Weak Mana Potion', description: 'A standard potion for restoring your depleted stamina.', price: 10 , user_id: 1)
Listing.create!(title: 'Weak Stealth Potion', description: 'A standard potion for increasing your natural stealth abilities.', price: 30 , user_id: 1)
Listing.create!(title: 'Weak Stamina Potion', description: 'A standard potion for healing your depleted stamina and endurance.', price: 15 , user_id: 1)
Listing.create!(title: 'Weak Defence Potion', description: 'A standard potion for increasing your natural defensive abilities.', price: 40 , user_id: 1)
Listing.create!(title: 'Weak Strength Potion', description: 'A standard potion for increasing you base level strength', price: 50 , user_id: 1)
Listing.create!(title: 'Weak Regen Potion', description: 'A standard potion for raising your natural healing properties.', price: 25 , user_id: 1)
Listing.create!(title: 'Weak Cold resistance Potion', description: 'A standard potion for increasing your resistance to the cold.', price: 35 , user_id: 1)