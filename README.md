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
| SDI(MOSI) | 11 | 
| SCK | 13|  
| LED | 3v3 | 
| SDO(MISO) | 12 | 
| T_CLK | 13 |
| T_CS | 8 |
| T_DIN | 11 |
| T_DO | 12 |
| T_IRQ | not connected |

We aren't using any of the touch capabilities here, though I went ahead and wired it up.  I don't totally understand it but Arduno has an ["SPI" interface](https://www.arduino.cc/reference/en/language/functions/communication/spi/) that the touchscreen and display devices both use.  The Output/Input/Clock pins are shared between the two peripherals, which the Chip Select is different (here it's pins 10 and 8).

Also wired up a joystick to control the maze:
| Thumbstick | Arduino |
| SW | 2 |
| VRY | A0 |
| VRX | A1 |
| +5V | 5V |
| GND | GND |