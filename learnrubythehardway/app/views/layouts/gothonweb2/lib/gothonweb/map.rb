module Map
class Room

  def initialize(name, description)
    @name = name
    @description = description
    @paths = {}
  end

  # these make it easy for you to access the variables
  attr_reader :name
  attr_reader :paths
  attr_reader :description

  def go(direction)
    return @paths[direction]
  end

  def add_paths(paths)
    @paths.update(paths)
  end

end
CENTRAL_CORRIDOR = Room.new("Central Corridor",
    """
    The Gothons of Planet Percal #25 have invaded your ship and destroyed
    your entire crew.  You are the last surviving member and your last
    mission is to get the neutron destruct bomb from the Weapons Armory,
    put it in the bridge, and blow the ship up after getting into an 
    escape pod.

    You're running down the central corridor to the Weapons Armory when
    a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume
    flowing around his hate filled body.  He's blocking the door to the
    Armory and about to pull a weapon to blast you. You can shoot, dodge, 
    or tell a joke
    """)

    CENTRAL_CORRIDOR_SHOOT = Room.new("The End",
    """
    Quick on the draw you yank out your blaster and fire at the Gothon.
    His clown costume is flowing and moving around his body, which throws 
    off your aim. Your laster hits his costume but misses him entirely. This
    completely ruins his brand new costume his mother bought him, which
    makes him fly int oan insane rage and blast you repeatedly in the face until
    you are dead. Then he eats you
    """ )

    CENTRAL_CORRIDOR_DODGE = Room.new("The End",
    """
    Like a world class boxer you dodge, weave, slip and slide right
    as the Gothons blaster cranks a laster past your head.
    In the middle of yout artful dodge your foot slips and you
    bang your head on the metal wall and pass out.
    You wake up shortly after only to die as the Gothon stomps on
    Your head and eats you.
    """ )

    LASER_WEAPON_ARMORY = Room.new("Laser Weapon Armory",
    """
    Lucky for you they made you learn Gothon insults in the academy.
    You tell the one Gothon joke you know:
    Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr.
    The Gothon stops, tries not to laugh, then busts out laughing and can't move.
    While he's laughing you run up and shoot him square in the head
    putting him down, then jump through the Weapon Armory door.

    You do a dive roll into the Weapon Armory, crouch and scan the room
    for more Gothons that might be hiding.  It's dead quiet, too quiet.
    You stand up and run to the far side of the room and find the
    neutron bomb in its container.  There's a keypad lock on the box
    and you need the code to get the bomb out.  If you get the code
    wrong then the lock closes forever and you can't
    get the bomb.  The code is 3 digits.
    """)

    LASER_WEAPON_ARMORY_WRONG = Room.new("The End",
    """
    The lock buzzes and you hear a sickening melting sound as the 
    mechanism is fused together. You decide to sit there, and finally
    the Gothons blow up hte ship from their ship and you die.
    """
      )


    THE_BRIDGE = Room.new("The Bridge",
    """
    The container clicks open and the seal breaks, letting gas out.
    You grab the neutron bomb and run as fast as you can to the
    bridge where you must place it in the right spot.

    You burst onto the Bridge with the netron destruct bomb
    under your arm and surprise 5 Gothons who are trying to
    take control of the ship.  Each of them has an even uglier
    clown costume than the last.  They haven't pulled their
    weapons out yet, as they see the active bomb under your
    arm and don't want to set it off. You can throw the bomb,
    or slowly place the bomb.
    """)

    THE_BRIDGE_THROW = Room.new("The End",
      """
      In a panic you throw the bomb at the Group of Gothons and make
      a leap for the door. Right as you drop it a Gothon shoots you 
      right in the back killing you. As you die, you see another Gothon
      frantically try to disarm the bomb. You die knowing they will probably
      blow up when it goes off
      """
      )


    ESCAPE_POD = Room.new("Escape Pod",
    """
    You point your blaster at the bomb under your arm
    and the Gothons put their hands up and start to sweat.
    You inch backward to the door, open it, and then carefully
    place the bomb on the floor, pointing your blaster at it.
    You then jump back through the door, punch the close button
    and blast the lock so the Gothons can't get out.
    Now that the bomb is placed you run to the escape pod to
    get off this tin can.

    You rush through the ship desperately trying to make it to
    the escape pod before the whole ship explodes.  It seems like
    hardly any Gothons are on the ship, so your run is clear of
    interference.  You get to the chamber with the escape pods, and
    now need to pick one to take.  Some of them could be damaged
    but you don't have time to look.  There's 5 pods, which one
    do you take?
    """)


    THE_END_WINNER = Room.new("The End",
    """
    You jump into pod 2 and hit the eject button.
    The pod easily slides out into space heading to
    the planet below.  As it flies to the planet, you look
    back and see your ship implode then explode like a
    bright star, taking out the Gothon ship at the same
    time.  You won!
    """)


    THE_END_LOSER = Room.new("The End",
    """
    You jump into a random pod and hit the eject button.
    The pod escapes out into the void of space, then
    implodes as the hull ruptures, crushing your body
    into jam jelly.
    """
    )
    ESCAPE_POD.add_paths({
        '2' => THE_END_WINNER,
        '*' => THE_END_LOSER
    })

    GENERIC_DEATH = Room.new("death", "You died.")

    THE_BRIDGE.add_paths({
        'throw the bomb' => THE_BRIDGE_THROW,
        'slowly place the bomb' => ESCAPE_POD
    })

    LASER_WEAPON_ARMORY.add_paths({
        '1''2''3' => THE_BRIDGE,
        '*' => LASER_WEAPON_ARMORY_WRONG
    })

    CENTRAL_CORRIDOR.add_paths({
        'shoot' => CENTRAL_CORRIDOR_SHOOT,
        'dodge' => CENTRAL_CORRIDOR_DODGE,
        'tell a joke' => LASER_WEAPON_ARMORY
    })

    START = CENTRAL_CORRIDOR

    ROOM_NAMES = {
        'CENTRAL_CORRIDOR' => CENTRAL_CORRIDOR,
        'CENTRAL_CORRIDOR_DODGE' => CENTRAL_CORRIDOR_DODGE,
        'CENTRAL_CORRIDOR_SHOOT' => CENTRAL_CORRIDOR_SHOOT,
        'THE_BRIDGE_THROW' => THE_BRIDGE_THROW,
        'LASER_WEAPON_ARMORY' => LASER_WEAPON_ARMORY,
        'LASER_WEAPON_ARMORY_WRONG' => LASER_WEAPON_ARMORY_WRONG,
        'THE_BRIDGE' => THE_BRIDGE,
        'ESCAPE_POD' => ESCAPE_POD,
        'THE_END_WINNER' => THE_END_WINNER,
        'THE_END_LOSER' => THE_END_LOSER,
        'START' => START,
    }

    def Map::load_room(session)
        # Given a session this will return the right room or nil
        return ROOM_NAMES[session[:room]]
    end

    def Map::save_room(session, room)
        # Store the room in the session for later, using its name
        session[:room] = ROOM_NAMES.key(room)
    end
end