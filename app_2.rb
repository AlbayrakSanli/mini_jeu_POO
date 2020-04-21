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
player1 = HumanPlayer.new("#{gets.chomp}")
puts "#{player1.name} est tout droit venu de la lune"
puts

josiane = Player.new("Josiane")
josé = Player.new("José")
enemies = [josiane,josé]

while (josiane.life_points > 0 || josé.life_points > 0) && player1.life_points > 0
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts
  puts "attaquer un joueur en vue :"
  puts "0 - #{josiane.show_state}"
  puts "1 - #{josé.show_state}"
  choix = gets.chomp
  puts "================================================="
  case choix
  when "a"
    player1.search_weapon
  when "s"
    player1.search_health_pack
  when "0"
    player1.attacks(josiane)
  when "1"
    player1.attacks(josé)
  else
    puts "ERREUR"
  end
  puts "================================================="
  puts
  puts "Les autres joueurs t'attaquent !"
  puts
  puts "/////////////////////////////////////////////////"
  enemies.each do |enemie|
    enemie.attacks(player1) if enemie.life_points > 0
    puts
  end
  player1.show_state
  puts "/////////////////////////////////////////////////"
  puts
end

puts "La partie est finie"
if player1.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else 
  puts "Loser ! Tu as perdu !"
end

binding.pry