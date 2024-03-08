# SOCD - Last Input Priority
AutoHotKey v.2.0.11 Script for Last Input Priority SOCD Resolution on PC  
Author: Zow / jjin43  
* NO LONGER A PRIVILEGE FOR HITBOX USERS  
* Supports L/R and U/D Last Input Priority - Default: `Left = [ a ]` `Right = [ b ]` `Up = [ space ]` `Down = [ s ]`  
* Caplock disabled while script is running due to AHK input limitations.  

## What is SOCD / Last Input Priority?
SOCD means "Simultaneous Opposing Cardinal Directions." It is the physical actuation of cardinal directions that are separate and opposite to each other - ie, pressing Left and Right at the same time. Basically, it's how 'left' and  'right' inputs are handled when both keys are pressed at the same time.  
In most cases, both directions are not initially actuated at the same time. When the second (or most recent) direction you pressed in the SOCD overrides the first, it is called Last Input Priority Resolution.  
[More on SOCD](https://www.hitboxarcade.com/blogs/support/what-is-socd)  
Ex:  
Holding 'Left' then inputting 'Right' = Character will move right until D is released. NORMALLY this would result in a 'Neutral' input.   

## Installation
(1) Download and extract the [Latest Release](https://github.com/jjin43/SOCD-LastInputPriority/releases/latest)  
(2) Run both SCOD-LIP-LR.exe and SCOD-LIP-UD.exe for Full LIP  
NOTE:  
SCOD-LIP-LR AND UD MUST BOTH BE RUNNING, due to AHK not supporting multithreading. LR and UD work independently if only 1 is needed.  

## Customization
To modify directional keys, modify variables and hotkey declarations. Follow directions in the comments, modify the variables at the top and the corresponding function name.  
(AHK v2.0 required for compiling to executable)  
You can check the currently set keys in `Help`  
[AHK List of Keys Variable Names](https://www.autohotkey.com/docs/v1/KeyList.htm#keyboard)  
[AHK Controller Variables (Needs to do some set up)](https://www.autohotkey.com/docs/v1/KeyList.htm#Joystick)

## Issues
* CPU Usage is rather high for a script this size, mostly due to the keyboardhook requirement and the large amount of inputs in Fighting Games.  
* When Caplock is On, the lowercase default inputs will cause Caplock flickering. Caplock is disabled and kept off while running to prevent this.  
