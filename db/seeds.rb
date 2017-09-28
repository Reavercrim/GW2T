# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


WeightClass.delete_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'weight_classes'")
WeightClass.connection.execute('ALTER TABLE weight_classes AUTO_INCREMENT = 1;')

weights = ["Heavy","Medium","Light","Clothing"]
weights.each do |w|
	WeightClass.create(name: w)
end

puts "  " + WeightClass.ids.to_s

########################################################################
IType.delete_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'i_types'")
IType.connection.execute('ALTER TABLE i_types AUTO_INCREMENT = 1;')

types = ["Armor","Weapon"]
types.each do |t|
	IType.create(name: t)
end

puts "  " + IType.ids.to_s

########################################################################

ArmorSlot.delete_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'armor_slots'")
ArmorSlot.connection.execute('ALTER TABLE armor_slots AUTO_INCREMENT = 1;')

slots = ["Boots","Coat","Gloves","Helm","HelmAquatic","Leggings","Shoulders"]
slots.each do |s|
	ArmorSlot.create(name: s)
end

puts "  " + ArmorSlot.ids.to_s

########################################################################

Rarity.delete_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'rarities'")
Rarity.connection.execute('ALTER TABLE rarities AUTO_INCREMENT = 1;')

rarities = ["Junk","Basic","Fine","Masterwork","Rare","Exotic","Ascended","Legendary"]
rarities.each do |r|
	Rarity.create(name: r)
end

puts "  " + Rarity.ids.to_s

########################################################################

WeaponType.delete_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'weapon_types'")
WeaponType.connection.execute('ALTER TABLE weapon_types AUTO_INCREMENT = 1;')

weaponTypes = ["Axe","Dagger","Focus","Greatsword","Hammer","Harpoon",
				"LongBow","Mace","Pistol","Rifle","Scepter",
					"Shield","ShortBow","Speargun","Staff","Sword","Torch","Trident","Warhorn"]
weaponTypes.each do |wt|
	WeaponType.create(name: wt)
end

puts "  " + WeaponType.ids.to_s


########################################################################

IFlag.delete_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'i_flags'")
IFlag.connection.execute('ALTER TABLE i_flags AUTO_INCREMENT = 1;')

itemFlags = ["AccountBindOnUse","AccountBound","HideSuffix","MonsterOnly","NoMysticForge","NoSalvage",
			"NoSell","NotUpgradeable","NoUnderwater","SoulbindOnAcquire","SoulBindOnUse","Unique"]
			
itemFlags.each do |f|
	IFlag.create(name: f)
end

puts "  " + IFlag.ids.to_s

########################################################################

Order.delete_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'orders'")
Order.connection.execute('ALTER TABLE orders AUTO_INCREMENT = 1;')

order_list = ["Buy","Sell"]
			
order_list.each do |o|
	Order.create(name: o)
end

puts "  " + Order.ids.to_s

########################################################################

Offer.delete_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'offers'")
Offer.connection.execute('ALTER TABLE offers AUTO_INCREMENT = 1;')


#
#Item.delete_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'items'")

#Weapon.destroy_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'weapons'")

#Armor.destroy_all
#ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'armors'")

