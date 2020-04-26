# SUDOKUSTACK v1.0
SUDOKUSTACK is savegame exploit for the game, `Carol Vorderman's Sudoku` on the Sony PSP. This exploit will allow users to run unsigned code on the Sony PSP handheld.
###

This github repo contains the source code of the a ColorSplash Payload and the Binary Loader payload (allows a user to run simple binary code from the memstick file, `H.BIN`.
###

## Upcoming Supports:
* EUR Support for `Carol Vorderman's Sudoku`
* Hello World SDK Binary Payload
###
###

## Requirements:
* A PSP/Vita
* A physical/digital copy of the game, Carol Vorderman's Sudoku (USA/EUR version)
* USB to go into USB-Mode for the PSP
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
* Once you're at the main menu, select the `SudokuSTACK` profile
* Navigate to `High Scores`
* Watch the magic happpen :D
###
###

## Support:
* USA/EUR version of the game 
* Works on every PSP model (1000, 2000, 3000, etc.)?
###
###

## FAQ:
1. __Q:__ Why are you messing around with the PSP?
    - __A:__ I wanted to just do it and I wanted to learn more about MIPS Exploitation
    
2. __Q:__ What can I do with this exploit?
    - __A:__ Run unsigned custom homebrew binaries (Something small yet but simple)

3. __Q:__ Will you do a writeup on your exploit?
    - __A:__ If you look in `NOTES.txt`, it's not that detailed but it's a straight-forward wrieup.


## Special Thanks to:
* [wololo](https://twitter.com/frwololo): Writeup to finding exploitable PSP games. (You can find it [here](http://wololo.net/2014/04/18/pspvita-how-to-find-your-own-exploits/))
* [qwikrazor87](https://twitter.com/qwikrazor87): Binary-Loader for 3.30+ (Coming Soon)
* [Flankler](https://twitter.com/freakler94): Color Flash Payload
###
## Exploit screenshot:
<img src="https://cdn.discordapp.com/attachments/159066660962041856/569685980567699458/Capture.JPG" width="320">
