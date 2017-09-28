class Item < ApplicationRecord
	belongs_to :rarity
	belongs_to :i_type
	has_many :armors
	has_many :weapons
	has_and_belongs_to_many :i_flags
	has_and_belongs_to_many :offers
	
	require 'net/http'
	require 'json'


		

	
	###########################################################
	def self.testApi()
		uri = URI('https://api.guildwars2.com/v2/items/12452')
		res = Net::HTTP.get_response(uri)

		# Status
		puts res.code       # => '200'

		# Body
		if res.class.body_permitted? and res.code == '200'
			json = JSON.parse(res.body)
			puts json.to_s
		end
	end
	
	###########################################################
	
	def self.getAllItems()
		uri_item_list = URI('https://api.guildwars2.com/v2/items')
		res = Net::HTTP.get_response(uri_item_list)

		# Body
		if res.class.body_permitted? and res.code == '200'
			json = JSON.parse(res.body)
			
			json = json.each_slice(200).to_a
			
			json.each do |n|
				addItem(n)			
			end
			
		end
	end
	
	###########################################################
	
	def self.addItem(item_ids)
		log_item = Logger.new('log/Item.log')
	
		uri = URI('https://api.guildwars2.com/v2/items')
		params = {:ids => item_ids.join(",")}
		
		uri.query = URI.encode_www_form(params)
		
		res = Net::HTTP.get_response(uri)

		# Body
		if res.class.body_permitted? and res.code == '200'
			json_all = JSON.parse(res.body)
			
			filter = ["Armor","Weapon"]
			json_all.each do |json|
			
				if !json["flags"].include?("NoSalvage") and !json["flags"].include?("NoSell") and filter.include?(json["type"])
			
					i = Item.new
					i.gid = json["id"]
					i.name = json["name"]
					i.chat_link = json["chat_link"]
					i.icon = json["icon"]
					i.level = json["level"]
					i.rarity = Rarity.find_by(name: json["rarity"])
					i.i_type = IType.find_by(name: json["type"])
					
					flags = IFlag.where(:name => json["flags"])
					i.i_flags << flags
					
					i.save
					
					a = false
					
					if json["type"] == "Armor" and i.save
					
						a = Armor.addArmor(json,i.id)
					
					elsif json["type"] == "Weapon" and i.save
					
						a = Weapon.addWeapon(json,i.id)
						
					end
										
					
					if !i.save
						log_item.error("Item: #{i.errors.full_messages.to_s}")
					end
				end
			end
		end		
	end
	###########################################################
end
