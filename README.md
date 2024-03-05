# SOCD - Last Input Priority
AutoHotKey v.2.0 Script for Last Input Priority SOCD Resolution on PC
Author: Zow / jjin43
* Supports L/R Last Input Priority - Default: `Left = [ a ]` `Right = [ b ]`  
* NO LONGER A PRIVILEGE FOR HITBOX USERS
* Up/Down LIP functionality [WIP] 

## What is SOCD / Last Input Priority?
SOCD means "Simultaneous Opposing Cardinal Directions." It is the physical actuation of cardinal directions that are separate and opposite to each other - ie, pressing Left and Right at the same time. Basically, it's how 'left' and  'right' inputs are handled when both keys are pressed at the same time.  
In most cases, both directions are not initially actuated at the same time. When the second (or most recent) direction you pressed in the SOCD overrides the first, it is called Last Input Priority Resolution.  
[More on SOCD](https://www.hitboxarcade.com/blogs/support/what-is-socd)  
Ex:  
Holding 'Left' then inputting 'Right' = Character will move right until D is released. NORMALLY this would result in a 'neutral' input.   


## Customization
To modify directional keys, modify variables and hotkey declarations. (AHK v2.0 required for compiling to executable)  
You can check the currently set keys in `Help`  
[AHK List of Keys Variable Names](https://www.autohotkey.com/docs/v1/KeyList.htm#keyboard)  

## Issues
CPU Usage is rather high for a script this size, mostly due to the large number of inputs in Fighting Games and the keyboardhook requirement.
