# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Weapon.create(name: 'Glock', weapon_type: 'Pistol', description: 'A basic pistol', range: '20', quality: 'common')
Weapon.create(name: 'AR-57', weapon_type: 'Assault', description: 'A basic AR', range: '30', quality: 'common')
Weapon.create(name: 'Stun gun', weapon_type: 'Pistol', description: 'A non-lethal pistol', range: '10', quality: 'uncommon')
Weapon.create(name: 'Widowmaker', weapon_type: 'Sniper', description: 'A deadly sniper', range: '200', quality: 'rare')
