require "pry"

class Player

#Définition des attributs d'un player
attr_accessor :name, :life_points

	#Méthode qui permet de créer nos différents players
	def initialize(name_str)
		@name = name_str
		@life_points = 10		
	end

	#Méthode qui permet d'afficher l'état de santé d'un joueur
	def show_state
		print "#{@name} a #{@life_points} points de vie"
	end

	#Methode permettant d'indiquer le niveau des dégâts supportés par le joueur : Damage_int est un entier 
	def gets_damage(damage_int)
		@life_points -= damage_int	
		if @life_points > 0
			return 
		else
			puts "le joueur #{name} a été tué !" 	
			return
		end
	end


	#Méthode qui permet d'indiquer qu'un player attaque un autre player
	def attacks(player_receiver)
		puts "#{name} attaque le joueur #{player_receiver.name}"
		damage_received = compute_damage

		if @life_points <= 0	
			return
		else
		puts "il lui inflige #{damage_received} points de dommages"
		end
		player_receiver.gets_damage(damage_received)	
	end

	#Méthode permettant de générer un dommage de manière aléatoire entre 1 et 6 
	def compute_damage
    return rand(1..6)
  	end
end

#Création d'une classe fille à partir de la classe mère Player
class HumanPlayer < Player

	attr_accessor :weapon_level

	def initialize(name_str)
		super (name_str)
		@weapon_level = 1
		@life_points = 100
		
	end

	#Méthode permettant de compléter le message portant sur l'état de santé du joueur par le niveau de son arme"
	def show_state
		super
		print " et une arme de niveau #{@weapon_level}"
	end

	#Méthode permettant de multiplier les dommages subit par un joueur en fonction du niveau de l'arme utilisée
	def compute_damage
		super * @weapon_level
	end

	#Méthode permettant de chercher une nouvelle arme et en fonction de son niveau par raport à l'arme actuelle décide ou non de l'utiliser
	def search_weapon
		dice = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{dice}"
			if dice > @weapon_level
				@weapon_level = dice
				puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
			else 
				puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
			end
	end

	#Méthode
	def search_health_pack
		dice = rand(1..6)
		if dice == 1
		puts "Tu n'as rien trouvé..."
		elsif dice >= 2 && dice <= 5
			if @life_points <= 50
			@life_points += 50
			else
			@life_points = 100
			end
		puts "Bravo, tu as trouvé un pack de +50 points de vie !"
		else dice = 6
			if @life_points <= 20
			@life_points += 80
			else 
			@life_points = 100
			end
		puts "Waow, tu as trouvé un pack de +80 points de vie !"
		end		
	end
end
