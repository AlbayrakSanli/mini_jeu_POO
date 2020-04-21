require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

joueur1 = Player.new("furkan")
joueur2 = Player.new("fatin")

puts "Passons à la phase d'attaque"
puts
while joueur1.life_points > 0 && joueur2.life_points > 0 
  puts "Voici l'état de chaque joueur"
  joueur1.show_state
  joueur2.show_state
  puts
  
  joueur1.attacks(joueur2)
  puts
  break if joueur2.life_points < 0
  joueur2.attacks(joueur1)
  puts
end

binding.pry