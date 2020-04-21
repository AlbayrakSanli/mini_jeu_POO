require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts
puts "Joueur 1, quel est votre nom ?"
my_game = Game.new("#{gets.chomp}")
puts "#{my_game.human_player.name} est tombé de la planète Mars"
puts
while my_game.is_still_ongoing?
  my_game.menu
  my_game.menu_choice("#{gets.chomp}")
  my_game.enemies_attack
  my_game.show_players
end
my_game.end
