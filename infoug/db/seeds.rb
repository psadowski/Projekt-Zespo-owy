99.times do |n|
  surname = "surname#{n+1}"
  name  = "name#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(surname: surname,
               name: name,
               email: email,
               password:              password,
               password_confirmation: password)
               
end

RedButton.create(button: true)

Department.create(name: 'BIOLOGII')
Department.create(name: 'CHEMII')
Department.create(name: 'EKONOMICZNY')
Department.create(name: 'FILOLOGICZNY')
Department.create(name: 'HISTORYCZNY')
Department.create(name: 'MATEMATYKI, FIZYKI I INFORMATYKI')
Department.create(name: 'NAUK SPOŁECZNYCH')
Department.create(name: 'OCEANOGRAFII I GEOGRAFII')
Department.create(name: 'PRAWA I ADMINISTRACJI')
Department.create(name: 'ZARZĄDZANIA')