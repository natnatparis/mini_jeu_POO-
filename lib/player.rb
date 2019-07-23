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