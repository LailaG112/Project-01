/*
    Project 01
    
    Requirements (for 15 base points)
    * Create an interactive fiction story with at least 8 knots 
    * Create at least one major choice that the player can make
    * Reflect that choice back to the player
    * Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
   * [+2] Include more than eight passages
   * [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    *[+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!
    
    Have the time affect the survival of the player
    You go upstairs to call for helo but they won't be there until a certain time.

*/

VAR weapon = ""
VAR time = 2
VAR items = 0



-> house

=== house ===
 It is currently {hour()} pm
You must escape before the killer finds you!
You are being chased by a killer. You run into an abandoned house to hide from them as they get closer. The house is big with many rooms and open spaces. Where do you go?
+ [Kitchen] -> kitchen
+ [Upstairs] -> upstairs
+ [Basement] -> basement
-> DONE


=== kitchen ===
 It is currently {hour()} pm
You go into the kitchen to grab something to defend yourself with. What do you grab?

*[Knife]
~ items = items + 3
    ~ weapon = "knife"
        -> kitchen_ending
*[Rolling pin]
~ items = items + 3
    ~weapon = "rolling pin"
        -> kitchen_ending
*[Pot]
~ items = items + 3
    ~ weapon = "pot"
        -> kitchen_ending
*[Go back] -> house
-> END

=== kitchen_ending ===

It is currently {hour()} pm
You grab the {weapon} where do you go next?
*[Hide] -> pantry
+ [Upstairs] -> upstairs
+ [Basement] -> basement
+[Go back] -> house
-> END

== pantry ==

It is currently {hour()} pm
You hide in the pantry with the {weapon} anxiously waiting for the killer to appear.
You hear foot steps approaching the door as you try to hold your breath.
+[Continue]-> continue
-> END

==continue==

It is currently {hour()} pm
You ready your weapon as the killer opens the door. 
{weapon == "knife": As the door begins to open you lunge towards the killer and stab him in the chest. As he's falls to the ground you run out of the house to call for help. YOU SURVIVED!}
{weapon == "rolling pin": As the door begins to open you swing the pin at the killers head but you missed and ended up knocking down the shelf trapping yourself under debris. The killer drags you out of the pantry and kills you. YOU DIE!}
 {weapon == "pot": As the door begins to open you swing the pot at the killer but he blocks it with his hands. In a panic you slam into the door knocking him down as you run into the basement.}
* {weapon == "pot"} [Run to the basement] -> basement
*[Go back] -> kitchen_ending
-> END

=== upstairs ===
It is currently {hour()} pm
You run upstairs into the nearest bedroom and you hear foot steps approaching. {not phone:There is a phone on the floor.} {not light: There is a flashlight on the bed}
+[Hide]-> closet
*[Pick up the phone] -> phone
*[Grab flashlight]-> light
+[Go back] -> house
-> END

== light ==
You picked up the flashlight
+[Go back] -> upstairs
-> END

== phone ==
~ items = items + 1
You picked up the phone
*[Go back]-> upstairs
-> END

== closet==
 You hide in the closet{ items == 3|| items == 0: under the clothes piled up on the floor. The killer opens the closet and quickly looks around. He seems to be in a hurry as he left after a taking a final glance. You stay there until morning. YOU SURVIVED!} {items >= 4: and dial 911 to call for help but the dial tone makes a loud noise that gives away your location. The killer finds you but since you picked up a {weapon} you use it to knock the killer out. You take the phone and run out of the room to get help. YOU SURVIVED!} {items == 1:and dial 911 to call for help but the dial tone makes a loud noise that gives away your location. The killer finds you. YOU DIED! }
-> END

=== basement ===
It is currently {hour()} pm
You run into the basement {time < 6: but you'll be easier to spot since the sun is still out.} 
{time >= 6: It is too dark to see anything. Find something to light the way.}
*{light} [Turn on flashlight]-> search
+[Go back] -> house
-> END
/*
+[Go back] -> house
    */
=== search ===
You use the flashlight to search for a way out. As you're looking around you find a bunch of boxes stacked up in a corner. What will you do?
*[Move them]-> move
*[Open it] -> open
-> END

=== move ===
You move the box and discover a hidden tunnel that leads outside. You quickly escape through the tunnel. YOU SURVIVED!!
-> END

=== open ===
 You don't find anything that could help you.
 +[Continue] -> death
-> END

== death ==
The killer heard the noise from the boxes and found you. YOU DIED!
-> END



== function hour ==
~ time = time + 1

{
        - time > 12:
        ~ time = 1
}
    
        
    ~ return time

















