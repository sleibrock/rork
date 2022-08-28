rork
====

rork is a Racket language/DSL for building Text-Based Adventure (TBA) games. The goal is to reduce the difficulty in creating TBA games by simplifying the process and creating an easy-to-use grammar that can create reproducible and shareable console games.

### Language Specifics

A text-based adventure game has a few simple components - rooms and items. The player entity exists to explore rooms and collect items, seeking to solve puzzles by using items correctly with a given set of actions.

* player - the player entity that is controllable
* room - a virtualized space that stores items and connections to other rooms
* item - a certain object the player collects to figure out and solve puzzles
* puzzle - a collection of challenges that must be solved in order for a player to move on through the game
* start - the initial location of the player within the game
* end - the goal destination for a player to reach to win the game
* lose - a dead-end that must be avoided and would cause a loss

## Sample Program

Here is a basic sketch of what a rork program should look like. From this, a basic game can be created and played.

```racket
#lang rork

(title "Rork's Lair")

(room "Bedroom"
  #:examine "This is your personal bedroom with some belongings."
  (item "Keys" #:desc "They jingle quite a bit.")
  (item "Shoes" #:desc "Can't leave home without em."))

(room "Kitchen"
  #:examine "Who cleans this place up? It's a mess."
  (item "Toaster" #:desc "Great for bread. Don't mix with water."))

(connect "Bedroom" "Kitchen")

(start "Bedroom"
  #:intro "The bad dreams rattle you and you wake up in your bed.")
```

The goal of the language is to provide a module that the user can load as a `#lang` file and start writing a game. This library is a series of functions that behind-the-scenes will create a workable game that players can interact and explore fully.

The grammar should be kept simple and will improve over time. The systems in the back are comprised of a knowledge database, a data structure designed to keep "facts" about the game and how it is progressing, like which doors are unlocked, which puzzles are solved, how many items are obtained, and so on and so forth.

The game map itself is largely a graph data structure connecting rooms to other rooms. Puzzles can be inserted into rooms, and can only be unlocked when certain conditions are met. Puzzle conditions can be written as anonymous functions and when the condition is satisfied, it will unlock itself and recognize that in the knowledge database.

### Commands

Commands should be pretty simple to use, and generic enough to design a broad range of games. Actions exposed are:

* `moveto` - moves the player from their current location to another
* `inspect` - inspect surroundings (view exits, items and other objects)
* `use` - use one item on another. Fails if no item(s) exist in inventory/room.
* `take` - take an item from the room and move it to the player's digital person
* `interact` - interact with an object in the room
* `status` - view your current items and location
