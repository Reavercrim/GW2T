class Armor < ApplicationRecord
	belongs_to :armor_slot
	belongs_to :weight_class
	belongs_to :item
	
	def self.addArmor(item,id)
		as = item["details"]["type"]
		wc = item["details"]["weight_class"]
		
		a = Armor.new
		a.armor_slot = ArmorSlot.find_by(name: as)
		a.weight_class = WeightClass.find_by(name: wc)
		a.item_id = id
		
		a.save
		
		return a
	end
end
