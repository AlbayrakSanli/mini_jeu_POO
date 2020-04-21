class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(name)
    furkan = Player.new("furkan")
    fatin = Player.new("fatin")
    cihad = Player.new("cihad")
    betul = Player.new("betul")
    @enemies_in_sight = [furkan,fatin,cihad,betul]
    @human_player = HumanPlayer.new(name)
    @players_left = 10
  end

  def kill_player(enemie_name)
    x= []
    @enemies_in_sight.each do |enemie|
        x << enemie if !enemie.name.eql?(enemie_name)
    end
    return @enemies_in_sight = x
  end

  def is_still_ongoing?
    x = 0
    @enemies_in_sight.each do |enemie|
      x += enemie.life_points
    end
    y = @human_player.life_points

    if x <= 0 || y <= 0
      return false
    else
      return true
    end
  end

  def new_players_in_sight

  end

  def show_players
    puts self.human_player.life_points
    @enemies_in_sight.each do |enemie|
      self.kill_player("#{enemie.name}") if enemie.life_points <= 0
    end
    puts @enemies_in_sight.length
  end

  def menu
    if self.is_still_ongoing?
      puts "Quelle action veux-tu effectuer ?"
      puts
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner"
      puts
      puts "attaquer un joueur en vue :"
      i = 0
      @enemies_in_sight.each do |enemie|
        i += 1
        if enemie.life_points <= 0
          self.kill_player("#{enemie.name}")
        else
          puts "#{i} - #{enemie.show_state}"
        end
      end
    end
  end

  def menu_choice(choix)
    @enemies_in_sight.each do |enemie|
      self.kill_player("#{enemie.name}") if enemie.life_points <= 0
    end
    
    if choix == "a"
      self.human_player.search_weapon
    elsif choix == "s"
      self.human_player.search_health_pack
    elsif choix == "1" 
      self.human_player.attacks(self.enemies_in_sight[0])
    elsif choix == "2" 
      self.human_player.attacks(self.enemies_in_sight[1])
    elsif choix == "3" 
      self.human_player.attacks(self.enemies_in_sight[2])
    elsif choix == "4" 
      self.human_player.attacks(self.enemies_in_sight[3])
    else
      puts "ERREUR !"
      puts
      self.menu
      puts
      puts "Retape juste la lettre ou le chiffre !"
      self.menu_choice(gets.chomp)
    end
  end

  def enemies_attack
    @enemies_in_sight.each do |enemie|
      self.kill_player("#{enemie.name}") if enemie.life_points <= 0
    end
    @enemies_in_sight.length.times do |i|
      self.enemies_in_sight[i].attacks(self.human_player)
    end
  end

  def end
    puts "La partie est finie"
    if self.human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else 
      puts "Loser ! Tu as perdu !"
    end
  end
end

