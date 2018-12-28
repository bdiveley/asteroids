uncle_jesse = User.create(id: 1, name: "Jesse Katsopolis", email: "uncle.jesse@example.com")
uncle_jesse.create_api_key(id: 1, value: "abc123")
uncle_jesse.favorites.create(id: 1, neo_reference_id: "2153306")
