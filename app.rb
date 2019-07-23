# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/game.rb et lib/player.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'

#Création des players
player1 = Player.new("Josiane")
player2 = Player.new("José")

#Présentation des différents protagonistes 
puts "Présentons les deux combattants"
puts "À ma droite #{player1.name}"
puts "À ma gauche #{player2.name}"
puts "----------------------------"

#Etat de santé initial des combattants (on veut un combat équitable)

while player1.life_points > 0 && player1.life_points > 0
	puts "Voici l'état de chaque joueur:" 
	puts player1.show_state
	puts player2.show_state
	puts "----------------------------"

	puts "Passons à la phase d'attaque:"
	player1.attacks(player2)
		break if player2.life_points <= 0	
	player2.attacks(player1)
	puts "----------------------------"
	
end


#binding.pry