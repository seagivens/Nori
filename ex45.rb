class Nori
  #The Hero of the story, white with brown spots
end
class Obstacle
  #the primary class for the following obstacles
  def fail
    puts "Oh Dear. That didn't work at all. Better luck next time. Try again?"
    print "> "
    retry = $stdin.gets.chomp

    if retry == "yes" || "y"
      puts "Let's start again."
    else
      puts "Better luck next time."
    end #ends if/else
  end #ends fail
end #ends class

class Foyer
#The entrance to the shop, starting place
def opening_scene
puts "Nori walks quietly into the shop and looks around. Not many customers, but there is a lot of sushi."
end
end
class Teapot < Obstacle
  #first obstacle, avoid the hot steam of the teapot by knocking it off the counter
end

class Owner < Obstacle
  #knocking it off the counter attracted attention. You must somehow distract the owner of the shop so he doesn't kick you out
end

class Rat < Obstacle
  #fight the rat
  def rat_fight
puts "After narrowly avoiding Virgil, you decide to continue to your destination by creeping under the counter."
puts "You hear a small noise and your keen cat senses see a rat in the distance."
end
end

class Sushi < Obstacle
  #choose the correct sushi. Nori is allergic to Shrimp, examine each sushi and choose the right one.
end

class Success
  puts "Nom Nom Nom."
end

class GameEngine
#the way to run the game
scenes = {
  'foyer' => Foyer.new,
}
end

def welcome
  puts "Welcome to Nori's Adventure"
end

welcome
engine = GameEngine.new
scenes.opening_scene
