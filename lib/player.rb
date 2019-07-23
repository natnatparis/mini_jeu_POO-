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


end