# Arduino Maze Game

We thought that it might be fun to make a "video game console" out of an Arduino and decided on a maze game.  

### Console
The design for the console was hand-drawn and then reproduced in OpenSCAD.

### Wiring 

We used a ILI9341 320x240 screen and an Arudino Nano.  Initially it only showed a white screen, but it tuns out that all its inputs require to be 3.3V, which meant we needed a 3.3V-5V logic level converter in between the Arduino and the screen.  With that in place, the wiring looks like:
|Display | Arduino |
| ----- | ----- |
| VCC | 3v3 |
| GND | GND | 
| CS | 10 | 
| RESET | 3v3 | 
| DC | 9 | 
| MOSI | 11 | 
| SCK | 13|  
| LED | 3v3 | 
| MISO | 12 | 

We aren't using any of the touch capabilities here, though it may be a good idea to go ahead and wire those up too.  TBD.

Also wired up a joystick to control the maze.

