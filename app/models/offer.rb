class Offer < ApplicationRecord
	belongs_to :order
	has_and_belongs_to_many :items
	
	require 'net/http'
	require 'json'
	
	def self.addOffer
	
		log_offer = Logger.new('log/Offer.log')
		
		item_ids_slice = Item.pluck(:gid).each_slice(200).to_a
		
		item_ids_slice.each do |n|
		
			uri = URI('https://api.guildwars2.com/v2/commerce/listings')
			params = {:ids => n.join(",")}
			
			uri.query = URI.encode_www_form(params)
			
			res = Net::HTTP.get_response(uri)
		
			# Body
			code_filter = ["200","206"]
			
			if res.class.body_permitted? and code_filter.include?(res.code)
				json_all = JSON.parse(res.body)
				
				log_offer.info("Query: #{json_all}")
				
				json_all.each do |json|
					log_offer.info("Query: #{json["id"]}")
				
					b = json["buys"].take(5)
					b.each {|x| x["order_id"] = Order.find_by(name: "Buy").id}
					
					s = json["sells"].take(5)
					s.each {|x| x["order_id"] = Order.find_by(name: "Sell").id}

					m = b.concat(s)
					m.each {|x| x["price"] = x.delete("unit_price")}
					
					Item.find_by(gid: json["id"]).offers = Offer.create(m)
				end
				
				
			else
				log_offer.error("Query: #{res.code}")
			end
		end
	end
	
	def self.getEzOffers
		
		#weapons = Arel::Table.new(:weapons)
		
		#s = offers.project(offers[:price].maximum.as("price"),items[:name],items[:level]).join(orders).on(offers[:order_id].eq(orders[:id])).join(ios).on(offers[:id].eq(ios[:offer_id])).join(items).on(items[:id].eq(ios[:item_id])).join(armors, Arel::Nodes::OuterJoin).on(armors[:item_id].eq(items[:id])).join(weapons, Arel::Nodes::OuterJoin).on(weapons[:item_id].eq(items[:id])).group(items[:gid]).where(orders[:name].eq("Buy")).order(offers[:price])
		
		t = offers.project(offers[:price].maximum.as("price"),items[:name],items[:level]).join(orders).on(offers[:order_id].eq(orders[:id])).join(ios).on(offers[:id].eq(ios[:offer_id])).join(items).on(items[:id].eq(ios[:item_id])).group(items[:gid]).where(orders[:name].eq("Buy")).order(offers[:price])
		
		
		
		
			
		return a = ActiveRecord::Base.connection.exec_query("SELECT i_types.name,CASE WHEN i_types.name = 'Weapon' THEN weapon_types.name WHEN i_types.name = 'Armor' THEN armor_slots.name END AS 'type',MAX(offers.price) AS price, items.name, items.level FROM offers INNER JOIN orders ON offers.order_id = orders.id INNER JOIN items_offers ON offers.id = items_offers.offer_id INNER JOIN items ON items.id = items_offers.item_id INNER JOIN i_types ON i_types.id = items.i_type_id LEFT OUTER JOIN armors ON armors.item_id = items.id LEFT JOIN armor_slots ON armor_slots.id = armors.armor_slot_id LEFT OUTER JOIN weapons ON weapons.item_id = items.id LEFT JOIN weapon_types ON weapon_types.id = weapons.weapon_type_id WHERE orders.name = 'Buy' AND offers.price < 1500 GROUP BY items.gid ORDER BY offers.price")
		
		
		
	end
	
	def self.getEzArmors(min,max,weight,slot)
	
		weight = weight.to_s
		slot = slot.to_s
		
	
		offers = Arel::Table.new(:offers)
		orders = Arel::Table.new(:orders)
		ios = Arel::Table.new(:items_offers)
		items = Arel::Table.new(:items)
		armors = Arel::Table.new(:armors)
		wc = Arel::Table.new(:weight_classes)
		as = Arel::Table.new(:armor_slots)
		
		#weapons = Arel::Table.new(:weapons)
		
		
		t = offers.project(offers[:price].maximum.as("price"),items[:name],as[:name].as("slot"),wc[:name].as("weight"),items[:level]).join(orders).on(offers[:order_id].eq(orders[:id])).join(ios).on(offers[:id].eq(ios[:offer_id])).join(items).on(items[:id].eq(ios[:item_id])).join(armors).on(armors[:item_id].eq(items[:id])).join(wc).on(wc[:id].eq(armors[:weight_class_id])).join(as).on(as[:id].eq(armors[:armor_slot_id])).group(items[:gid]).where(orders[:name].eq("Buy")).where(items[:level].between(min..max)).where(wc[:name].eq(weight)).where(as[:name].eq(slot)).order(offers[:price])
		
		
		return ActiveRecord::Base.connection.exec_query(t.to_sql)
	end
	
	
	def self.getEzWeapons(min,max,type)
	
		typ = type.to_s
		
	
		offers = Arel::Table.new(:offers)
		orders = Arel::Table.new(:orders)
		ios = Arel::Table.new(:items_offers)
		items = Arel::Table.new(:items)
		weapons = Arel::Table.new(:weapons)
		wt = Arel::Table.new(:weapon_types)
		
		
		t = offers.project(offers[:price].maximum.as("price"),items[:name],wt[:name].as("type"),items[:level]).join(orders).on(offers[:order_id].eq(orders[:id])).join(ios).on(offers[:id].eq(ios[:offer_id])).join(items).on(items[:id].eq(ios[:item_id])).join(weapons).on(weapons[:item_id].eq(items[:id])).join(wt).on(wt[:id].eq(weapons[:weapon_type_id])).group(items[:gid]).where(orders[:name].eq("Buy")).where(items[:level].between(min..max)).where(wt[:name].eq(typ)).order(offers[:price])
		
		
		return ActiveRecord::Base.connection.exec_query(t.to_sql)
	end
end
