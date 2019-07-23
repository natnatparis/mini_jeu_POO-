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
		puts "#{@name} a #{@life_points} points de vie"
	end

	#Methode permettant d'indiquer le niveau des dégâts supportés par le joueur 
	def gets_damage(damage_int)
		@life_points -= damage_int
		

		if @life_points > 0
			return 
		else
			puts "le joueur José a été tué !" 	
			return
		
		end
	end







end