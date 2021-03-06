# frozen_string_literal: true

user1 = User.create(email: 'admin@example.com', password: 'SuperSecret123!', password_confirmation: 'SuperSecret123!',
                   username: 'Admin123')

user2 = User.create(email: 'user@example.com', password: 'SuperSecret123!', password_confirmation: 'SuperSecret123!',
username: 'Admin123')

character1 = Character.create(name: 'Steve', description: 'A regular guy', user: user1,  force: 1, long_range: 2, acrobatics: 1, stealth: 1)
Character.create(name: 'Bob', description: 'An even more regular guy', user: user1)

character2 = Character.create(name: 'Melissa', description: 'A regular gal', user: user2, melee: 1, tech: 2, investigation: 1, persuasion: 1)

weapon1 = Weapon.create(name: 'Glock', weapon_type: 'Short Range', description: 'A basic pistol', range: '20', quality: 'Basic',
              dice_type: '4', dice_qty: '2', damage_type: 'Kinetic', ammo: '3', proficiency: '2', character_ids: [character1.id])
weapon2 = Weapon.create(name: 'AR-57', weapon_type: 'Medium Range', description: 'A basic AR', range: '40', quality: 'Basic',
              dice_type: '4', dice_qty: '2', damage_type: 'Kinetic', ammo: '3', proficiency: '2', character_ids: [character2.id])
Weapon.create(name: 'Stun gun', weapon_type: 'Short Range', description: 'A non-lethal pistol', range: '10',
              quality: 'Refined', dice_type: '4', dice_qty: '2', damage_type: 'Kinetic', ammo: '3', proficiency: '2', character_ids: [character2.id])
Weapon.create(name: 'Widowmaker', weapon_type: 'Long Range', description: 'A deadly sniper', range: '200', quality: 'Superior',
              dice_type: '4', dice_qty: '2', damage_type: 'Cryo', ammo: '3', proficiency: '2', character_ids: [character1.id])
Weapon.create(name: 'Baseball Bat', weapon_type: 'Melee', description: 'A regular bat', range: '1', quality: 'Basic',
                dice_type: '4', dice_qty: '2', damage_type: 'Kinetic', ammo: '1', proficiency: '3', character_ids: [character1.id])
Weapon.create(name: 'Knife', weapon_type: 'Melee', description: 'A knife', range: '1', quality: 'Basic',
                  dice_type: '8', dice_qty: '2', damage_type: 'Kinetic', ammo: '3', proficiency: '2', character_ids: [character1.id])
Weapon.create(name: 'Frost Grenade', weapon_type: 'Short Range', description: 'All creatures hit by this roll for Force or Acrobatics, if the total is less than the damage of this grenade, they are frozen', range: '10', quality: 'Superior',
                    dice_type: '4', dice_qty: '4', damage_type: 'Cryo', ammo: '1', proficiency: '0', character_ids: [character1.id])
Weapon.create(name: 'The Dragon', weapon_type: 'Short Range', description: 'A creature damaged by this must make a Resistance check, if they fail they are burned for 10 seconds', range: '5', quality: 'Mythic',
                    dice_type: '8', dice_qty: '3', damage_type: 'Incendiary', ammo: '3', proficiency: '5', character_ids: [character1.id])

class1 = Classification.create(name: 'Elemental', description: 'The powers of fire, ice and lightning are the tools weilded by the Elemental classification.', strike_stat: 'discipline', might_stat: 'constitution', dodge_stat: 'discipline', gene_pool: '3d6 + 3')
class2 = Classification.create(name: 'Superhuman', description: 'A human that has been enhanced with superior intelligence, strength, and speed. They may not have the flashiest moves but what they lack in style they make up for in consistency. Their abilities have uses in all areas - offence, defence and control.', strike_stat: 'strength', might_stat: 'constitution', dodge_stat: 'discipline', gene_pool: '4d6 + 2')
class3 = Classification.create(name: 'Nova', description: 'This class sees the battlefield as putty, to be shaped at their will. They are not the most lethal class but their ability to control the field is unparalleled. Barriers, telekinesis and shockwaves are all staples of this class.
 ', strike_stat: 'intelligence', might_stat: 'will', dodge_stat: 'sense', gene_pool: '4d4+3')
class4 = Classification.create(name: 'Chimera', description: 'Part human, part beast - the Chimera classification is the result of countless, unethical human-animal experiments. Depending on the animal strain, the Chimera can develop very unique abilties', strike_stat: 'strength', might_stat: 'constitution', dodge_stat: 'discipline', gene_pool: '5d6 + 1')

Character.create(name: 'Maple', description: 'An extra regular gal', user: user2, classification_ids: [class1.id])
Character.create(name: 'Harold', description: 'A not so regular gal', user: user2, classification_ids: [class2.id])
Character.create(name: 'Arthur', description: 'An old gal', user: user2, classification_ids: [class3.id])
Character.create(name: 'Benenedict', description: 'A robot gal', user: user2, classification_ids: [class4.id], favourite: true)
Character.create(name: 'Zog', description: 'An extra regular gal', user: user2, classification_ids: [class1.id])
Character.create(name: 'Arturis', description: 'A not so regular gal', user: user2, classification_ids: [class2.id])
Character.create(name: 'Hercules', description: 'An old gal', user: user2, classification_ids: [class3.id], favourite: true)
Character.create(name: 'Chad', description: 'A robot gal', user: user2, classification_ids: [class4.id])
character2.classification_ids = [class4.id]

50.times do |i|
  Weapon.create!(name: "ZWeapon" + i.to_s, weapon_type: 'Melee', description: 'A knife', range: '1', quality: 'Basic',
    dice_type: '8', dice_qty: '2', damage_type: 'Kinetic', ammo: '3', proficiency: '2', character_ids: [character1.id])
end

