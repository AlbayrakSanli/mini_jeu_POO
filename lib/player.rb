class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points > 0
      "#{@name} a #{@life_points} points de vie"
    else
      "#{@name} a 0 points de vie"
    end
  end

  def gets_damage(damage)
    @life_points -= damage
    puts "Le joueur #{@name} a été tué !" if @life_points <= 0
  end

  def attacks(player_name)
    puts "Le joueur #{@name} attaque le joueur #{player_name.name}"
    attack_player = self.compute_damage
    player_name.gets_damage(attack_player)
    puts "Il lui inflige #{attack_player} points de dommages" if player_name.life_points > 0
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    if @life_points > 0
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    else
      puts "#{@name} a 0 points de vie"
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health = rand(1..6)
    if health == 1
      puts "Tu n'as rien trouvé..."
    elsif health >= 2 && health <= 5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points < 50
        @life_points += 50
      else 
        @life_points = 100
      end
    else
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points < 20
        @life_points += 80
      else 
        @life_points = 100
      end
    end
  end

end