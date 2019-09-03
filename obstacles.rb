
class Nori
  #The Hero of the story, white with brown spots
  def start
    # 悠真 - Yuma
    # 悠人 - Yuto
    # 陽翔 - Haruto
    kanji_names = ["悠真", "悠人", "陽翔"]
    $owner_name = kanji_names.sample
    puts "Nori lives with her owner #{$owner_name} behind his sushi restaurant. Nori is hungry. #{$owner_name} has gone out to run some errands, leaving both Nori and the restaurant unattended."
    return 'foyer'
  end
end

class Obstacle
  #the primary class for the following obstacles
  def input
    print "> "
  end
end

class Fail
  def start
    puts "Oh Dear. That didn't work at all. Try again?"
    print "> "
    try_again = $stdin.gets.chomp.downcase


    if try_again.include?("y")
      puts "That's the Spirit!"
      return 'foyer'
    else
      puts "Better luck next time."
      exit
    end #ends if/else
  end
end #ends fail

class Foyer < Obstacle
  def start
    puts "Nori looks around the restaurant. There is a long conveyer belt coming out of the kitchen, filled with delicious and colorful sushi."
    puts "There aren't many people here yet, it's still early in the day. She needs to get to the kitchen, should she slink along the wall, or dart across the floor?"
    input
    cross_foyer = $stdin.gets.chomp.downcase

    if cross_foyer.include?("slink") || cross_foyer.include?("wall")
      puts "Nori flattens herself against the wall and crawls toward the kitchen. It takes her too long to get through the restaurant though, and she is spotted by a customer, who shoos her out of the restaurant."
      return 'fail'

    elsif cross_foyer.include?("dart") || cross_foyer.include?("floor")
      puts "Nori crouches down low on the floor and waits for the right moment. She darts across the floor as a furry white ball and runs through the open kitchen door."
      puts "Nori hops up on the counter to head towards the sushi."
      return 'teapot'
    else
      puts "That wasn't one of the options."
      return 'foyer'
    end #ends sneak/slink
  end #start
end #class

class Teapot < Obstacle
  #first obstacle, avoid the hot steam of the teapot by knocking it off the counter
  def start
    puts "There is a teapot with steam coming out of it that she needs to get past. What should she do?"
    puts "1. Go Around the Teapot."
    puts "2. Jump down off the counter."
    puts "3. Knock the Teapot off the counter."
    input
    counter = $stdin.gets.chomp.downcase

    if counter.include?("1") || counter.include?("go around")
      puts "Nori attempts to navigate around the teapot, but the hot steam coming from the teapot gets in her face and hurts her."
      return 'fail'
    elsif counter.include?("2") || counter.include?("jump")
      puts "Nori jumps off of the counter and avoids the teapot entirely. She calmly walks over to the conveyor belt."
      return 'sushi'
    elsif counter.include?("3") || counter.include?("knock") || counter.include?("off")
      puts "In true cat fashion, Nori knocks the teapot off the counter and continues on her merry way as the teapot crashes to the ground, breaking and spilling hot tea all over. Was it an heirloom? Probably."
      return 'owner'
    else
      puts "What did you want to do?"
      return 'teapot'
    end #end if/else
  end
end

class Owner < Obstacle
  #knocking it off the counter attracted attention. You must somehow distract the owner of the shop so he doesn't kick you out
  def start
    puts "#{$owner_name}, the owner walks in to investigate the loud noise. He picks up the teapot and inspects it. It appears to be chipped, but mostly intact. He starts to look around for a source of the disturbance."
    puts "If he finds Nori, he will surely scold her and take her back home. What should she do?"
    puts "1. Do something clever"
    puts "2. Don't move"
input
avoid_owner = $stdin.gets.chomp.downcase

if avoid_owner.include?("1") || avoid_owner.include?("clever")
  puts "Nori decides to do something clever and completely avoids #{$owner_name}. He decides it was a gust of wind and leaves the kitchen."
  puts "Nori continues on her adventure."
  return 'sushi'

elsif avoid_owner.include?("2") || avoid_owner.include?("move")
  puts "Nori stays completely still and hopes #{$owner_name} doesn't notice her. However, she is standing on a counter and he quickly sees her. He sends Nori back home."
  return 'fail'
else
  puts "That won't work, try one of the other options."
  return 'owner'
end #end if/else
  end
end

class Sushi < Obstacle
  #choose the correct sushi. Nori is allergic to Shrimp, examine each sushi and choose the right one.
  def start
    puts "There are sushi lined up on the conveyor belt to go by. All of Nori's hard work is about to pay off."
    puts "Don't forget, Nori is allergic to Shrimp, so she will need to check the sushi first to make sure it doesn't have shrimp in it."
    puts "The sushi comes down the line in groups of three. Select the left, center, or right one to investigate."
    input
      $sushi_choice = $stdin.gets.chomp.downcase
      sushi = ["left", "center", "right"]
      good_sushi = sushi.sample

      while $sushi_choice != good_sushi
        shrimp = ["Dragon Roll", "Tiger Roll", "Hot Night Roll", "Soho Roll"]
        puts "Nori sniffs the sushi and realizes it's a #{shrimp.sample}. Better grab a different one. She waits for the next group of sushi to come down the line."
        puts "The next group of sushi comes. Which one should she check?"
        input
          $sushi_choice = $stdin.gets.chomp.downcase
          sushi = ["left", "center", "right"]
          good_sushi = sushi.sample
      end #end while
     return 'success'
    end #end start
end #end Sushi Class

class Success
  def start
    sushi_filling = ["a California Roll", "a Spicy Salmon Roll", "a Spider Roll", "Katsuo", "Maguro", "Tako", "an Alaskan Roll"]
    puts "Nori sniffs at the #{$sushi_choice} sushi and determines it to be #{sushi_filling.sample}. She happily takes the sushi and runs off to eat it."
    puts "Nom Nom Nom."
  end
end
