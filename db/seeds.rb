# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


ken = User.create(first_name: 'Ken',
                  last_name: 'Erickson',
                  email: 'kenneth.erickson12@gmail.com',
                  is_admin: true,
                  password: 'password',
                  password_confirmation: 'password')

justin = User.create(first_name: 'Justin',
                     last_name: 'Wirman',
                     email: 'jwirman@gmail.com',
                     is_admin: true,
                     password: 'password',
                     password_confirmation: 'password')
ken.confirm!
justin.confirm!

Med.create(generic_name: 'lisinopril',
           brand_name:   'Zestril',
           strength:     '10mg')
Med.create(generic_name: 'donepezil',
           brand_name:   'Aricept',
           strength:     '5mg')
Med.create(generic_name: 'memantine XR',
           brand_name:   'Namenda XR',
           strength:     '21mg')
Med.create(generic_name: 'memantine',
           brand_name:   'Namenda',
           strength:     '5mg')

