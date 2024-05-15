# Initial Admin
User.create!(
    username: "admin",
    name: "Chief Administrator",
    email: "admin@collections.org",
    password: "admin", 
    password_confirmation: "admin",
    admin: true
  )