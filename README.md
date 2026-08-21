# Cards Slayer
### by Karim Ahmed


## Gamplay:
It is a very basic card game which you have turns on your turn you can play cards (attack / block / skill) those cards cost mana and the mana system works that for every turn you have 3 mana
After your turn the game apply ralics which are close to powerups each one has an effect on you or on the enemy you can click on it to view what it deos
The cards also you can hover over them so a tip will appear for each card and there are sm called status or effects they are under you character or under an enemy also click on it so you can see what it deos

### Cards:
Axe: Deal 6 dmg to one enemy.
Big slam: Deal 4 dmg and apply 2 exposed effects for the enemy.
Shield: Gives you 4 blocks for 1 round.
True strength: Gives you 2 muscels each turn.
Big Slash: Deals 4 dmg for all enemies in the current battle.

### Relics (powerups):
Explosive barrel: Deals 2 dmg to all enemies in the start of each turn of yours.
Mana posion: Gives you 1 Mana more for the first turn in each battle.
Healing posion: Heals you 5 hearts in the end of each battle.
Reinforced armor: Gains you 3 armors in the end of each of our turns.
Big Coupon: Makes all the cards and relics 50% off in all the shops of the current run.

### Effects:
Exposed: Makes the owner of it take 3 more dmg for any attack preformed on him.
Muscle: Makes the owner deal 1 more dmg for each muscle he has on any of his attacks.

## Main Story:
It all began in 989 There was a bad king called "carter". This king was an alien and no body know that so there was 3 friends a mage, warrior, and an assassin. This group of the 3 guys are captured and in the prison under the grounnd so you play as a character of our group and then the game begins.


## How to win:
Kill all the enemies and The boss fight and then you will win the turnment.

## Game architect:


## How the game works:
### Map generator: 
The map generator is like a matrix which is made using the basic idea of 2D lists like i for the outer list and j for inner one and 2 loops inside of each other. The the game mainly loads the mainmenu scene the the Run scene in the run scene every thing happenes and every other scene is initiated inside it and displayed above it.

### Battles:
The battle scenes are working with tiers like tier 0, tier 1 and tier 2 (Boss Fight). When the map is generated each battle icon int he map is assigned to a battle from the battles folder. Then you go throught the map and the conteniue your battles

### The shop:
The shop is working with generating a cards and relics from arrays i gave it to him so they can be displayed and bought if the player wants.

### Campfire: 
It simply heals you 30% of your current health

### Boss fight:
Same as the battle scenes but with a more dangrouse enemy and new effects.


## Credits:
Assets: https://kenney.nl/assets/tiny-dungeon
Sounds:
Weighted chance based action idea: 
https://kehomsforge.com/tutorials/single/weighted-random-selection-godot/
map generator idea: https://kosgames.com/slay-the-spire-map-generation-guide-26769/
