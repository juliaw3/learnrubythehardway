class Scene
	def enter()

		exit(1)
	end
end

class Engine
	def initialize(scene_map)
		@scene_map = scene_map
	end

	def play()
		current_scene = @scene_map.opening_scene()
		last_scene = @scene_map.next_scene('finished')

		while current_scene != last_scene
			next_scene_name = current_scene.enter()
			current_scene = @scene_map.next_scene(next_scene_name)
		end
		current_scene.enter()
		
	end
end

class Death < Scene

	@@quips = [
		"You died. You kind of suck at this.",
		"Your mom would be proud...if she were smarter.",
		"Such a luser.",
		"I have a small puppy that's better at this"
	]
	def enter()
		puts @@quips[rand(0..(@@quips.length - 1))]
		exit(1)
	end
end

class CentralCorridor < Scene
	def enter()
		puts "The Gothons of planet Percal #25 have invaded your ship and destroyed"
		puts "Your entire crew. you are the last serviving member and your last"
		puts "mission is to get the neutron destruct bomb from the Weapons Armory"
		puts "put it in the bridge, and blow up the ship after getting into an"
		puts "escape pod."
		puts "\n"
		puts "You are running down the central corridor to the Weapons Armory when"
		puts "a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown"
		puts "costume"
		puts "flowing around his hate filled body. Hes blocking the door to the "
		puts "Armory and about to pull a weapon to blast you"
		puts "You can shoot, dodge, or tell a joke"
		print "> "

		action = $stdin.gets.chomp

		if action == "shoot"
			puts "Quick on the draw you yank out your blaster and fire at the Gothon"
			puts "His clown costume is flowing and moving around his body, which throws "
			puts "off your aim. Your laster hits his costume but misses him entirely. This"
			puts "completely ruins his brand new costume his mother bought him, which"
			puts "makes him fly int oan insane rage and blast you repeatedly in the face until"
			puts "you are dead. Then he eats you"

			return 'death'

		elsif action == "dodge"
			puts "Like a world class boxer you dodge, weave, slip and slide right"
			puts "as the Gothons blaster cranks a laster past your head."
			puts "In the middle of yout artful dodge your foot slips and you"
			puts "bang your head on the metal wall and pass out."
			puts "You wake up shortly after only to die as the Gothon stomps on"
			puts "Your head and eats you"

			return 'death'

		elsif action == 'tell a joke'
			puts "lucky for you they made you learn Gothon insults in the academy"
			puts "You tell te one Gothon joke you know"
			puts "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr."
			puts "The Gothon stops, tried not to laught, then busts out laughing and can't move"
			puts "While hes lauhging you run up and shoot hime square in the head"
			puts "putting him down, then jump through the Weapon Armory door"

			return 'laser_weapon_armory'

		else
			puts "DOES NOT COMPUTE"
			retun 'central_corridor'
		end
	end
end

class LaserWeaponArmory < Scene
	def enter()
		puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
		puts "for more Gothons that might be hiding. Its dead quiet, too quiet"
		puts"You stand up and run to the far left side of the romm and find the"
		puts "neutron bomb in its container. There's a keypad lock on the box"
		puts "and you need the code to get the bomb out. If you get the code"
		puts "wrong 10 times then the lock closes forever and you cant "
		puts "get the bomb. The code is three digits"
		code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
		print "[keypad]> "
		guess = $stdin.gets.chomp
		guesses = 0

		while guess != code && guesses < 10
			puts "BZZZZEDDD"
			guesses += 1
			print "[keypad]> "
			guess = $stdin.gets.chomp
		end

		if guess == code
			puts "The container clicks open and the seal breaks, letting gas out."
       	    puts "You grab the neutron bomb and run as fast as you can to the"
       	    puts "bridge where you must place it in the right spot."

       	    return 'the_bridge'

       	else
       		puts "The lock buzzes one last time and then you hear a sickening"
            puts "melting sound as the mechanism is fused together."
            puts "You decide to sit there, and finally the Gothons blow up the"
            puts "ship from their ship and you die."

            return 'death'
        end
	end
end

class TheBridge < Scene
	def enter()
		puts "You burst onto the Bridge with the netron destruct bomb"
        puts "under your arm and surprise 5 Gothons who are trying to"
        puts "take control of the ship.  Each of them has an even uglier"
        puts "clown costume than the last.  They haven't pulled their"
        puts "weapons out yet, as they see the active bomb under your"
        puts "arm and don't want to set it off."
        puts "You can throw the bomb or slowly place the bomb"
        print "> "

        action = $stdin.gets.chomp

        if action == "throw the bomb"
        	 puts "In a panic you throw the bomb at the group of Gothons"
             puts "and make a leap for the door.  Right as you drop it a"
             puts "Gothon shoots you right in the back killing you."
             puts "As you die you see another Gothon frantically try to disarm"
             puts "the bomb. You die knowing they will probably blow up when"
             puts "it goes off."

             return 'death'

         elsif action == "slowly place the bomb"
			 puts "You point your blaster at the bomb under your arm"
      		 puts "and the Gothons put their hands up and start to sweat."
      		 puts "You inch backward to the door, open it, and then carefully"
     		 puts "place the bomb on the floor, pointing your blaster at it."
      		 puts "You then jump back through the door, punch the close button"
      		 puts "and blast the lock so the Gothons can't get out."
      		 puts "Now that the bomb is placed you run to the escape pod to"
      		 puts "get off this tin can."

         	return 'escape_pod'

         else
         	puts "DOES NOT COPMUTE"
         	return 'the_bridge'
         end
	end
end

class EscapePod < Scene
	def enter()
	    puts "You rush through the ship desperately trying to make it to"
        puts "the escape pod before the whole ship explodes.  It seems like"
        puts "hardly any Gothons are on the ship, so your run is clear of"
        puts "interference.  You get to the chamber with the escape pods, and"
        puts "now need to pick one to take.  Some of them could be damaged"
        puts "but you don't have time to look.  There's 5 pods, which one"
        puts "do you take?"

        good_pod = rand(1..5)
        print "[pod #]> "
        guess = $stdin.gets.chomp.to_i

        if guess != good_pod
            puts "You jump into pod %s and hit the eject button." % guess
     	    puts "The pod escapes out into the void of space, then"
      	    puts "implodes as the hull ruptures, crushing your body"
      	    puts "into jam jelly."

      	    return 'daeth'
      	else
      		puts "You jump into pod %s and hit the eject button." % guess
      	    puts "The pod easily slides out into space heading to"
      	    puts "the planet below.  As it flies to the planet, you look"
      	    puts "back and see your ship implode then explode like a"
      	    puts "bright star, taking out the Gothon ship at the same"
      	    puts "time.  You won!"

      	    return 'finished'
      	end
	end
end

class Finished < Scene
	def enter()
		puts "You won! Good job!"
	end
end

class Map
	@@scenes = {
		'central_corridor' => CentralCorridor.new(),
		'laser_weapon_armory' => LaserWeaponArmory.new(),
		'the_bridge' => TheBridge.new(),
		'escape_pod' => EscapePod.new(),
		'death' => Death.new(),
		'finished' => Finished.new(),
	}
	def initialize(start_scene)
		@start_scene = start_scene
	end

	def next_scene(scene_name)
		val = @@scenes[scene_name]
		return val
	end

	def opening_scene()
		return next_scene(@start_scene)
	end
end

a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()
