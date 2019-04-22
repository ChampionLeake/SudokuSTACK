# SUDOKUSTACK v1.0
SUDOKUSTACK is savegame exploit for the game, `Carol Vorderman's Sudoku` on the Sony PSP. This exploit will allow users to run unsigned code on the Sony PSP handheld.
This github repo contains the source code of the the game's color splash binary and the exploitable save. This exploit will soon support a binary loader.
###
__((NOTE THAT THIS EXPLOIT IS STILL BEING WORKED ON AND TESTED FOR OTHER PSP/VITA FIRMWARES))__
###
###

## Upcoming Supports:
* EUR Support for `Carol Vorderman's Sudoku`
* Binary Loader support to load other unsigned code
###
###

## Requirements:
* A PSP/Vita
* A physical/digital copy of the game, Carol Vorderman's Sudoku (USA/EUR version)
* USB to go into USB-Mode for the PSP/Vita
###
###

## Installing the exploit:
__NOTE:__ This will overwrite your current savedata and will make some areas of the game inoperable. Please backup your savedata (if possible) before installing the exploit.
Also, creating/modifying the save data for this game may modify certain bytes to the binary payload and may make this exploit unusable.
1. Boot your PSP into USB-Mode.
2. Navigate to the `/PSP/SAVEDATA/` directory.
3. Download and extract the `SudokuStack-v1.zip` archive and navigate to the folder of your game's region (USA/EUR) inside the archive. 
3. Extract the `ULUS10126DATA01` folder (from the `SudokuStack-v1.zip` archive) into the `/PSP/SAVEDATA/` directory.
###
###

## Triggering the exploit:
* Once you're at the main menu, select the `SUDOKUSTACK` profile
* Navigate to `High Scores`
* Watch the magic happpen :D
###
###

## Support:
* USA version of the game 
* Should work on any PSP handheld model I believe?
###
###

## FAQ:
1. __Q:__ Why are you messing around with the PSP?
    - __A:__ I wanted to just do it and I wanted to learn more about MIPS Exploitation
    
2. __Q:__ What can I do with this exploit?
    - __A:__ Run unsigned custom homebrew binaries (Something small yet but simple)

3. __Q:__ Does this work on a PSVita?
    - __A:__ Well, I believe it should work on the PSVita, but you can submit an issue so I can take a look into it :)

4. __Q:__ CanI install CFW using this exploit?
    - __A:__ You actually could but there's so much better exploits out there that can do that.

5. __Q:__ Will you do a writeup on your exploit?
    - __A:__ If you look in `NOTES.txt`, it's not that detailed but it's a straight-forward wrieup.


## Special Thanks to:
* [wololo](https://twitter.com/frwololo): Writeup to finding exploitable PSP games. (You can find it [here](http://wololo.net/2014/04/18/pspvita-how-to-find-your-own-exploits/))
* [qwikrazor87](https://twitter.com/qwikrazor87): Binary-Loader for 3.30+ (Coming Soon)
* [Flankler](https://twitter.com/freakler94): Color Flash Payload
###
## Exploit screenshot:
<img src="https://cdn.discordapp.com/attachments/159066660962041856/569685980567699458/Capture.JPG" width="320">
