class Weapon < ApplicationRecord
	belongs_to :weapon_type
	belongs_to :item
	
	def self.addWeapon(item,id)
		wt = item["details"]["type"]
		w = Weapon.new
		w.weapon_type = WeaponType.find_by(name: wt)
		w.item_id = id
		
		w.save
		
		return w
		
	end
end
