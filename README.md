# Ethminer_OC_loader

Loads MSI afterburner profile 5 for mining, then sets back to profile 4 when exiting.



Needs to be run as admin to stop  UAC prompts for overclocking

## How to use
Initial setup - Edit the .bat file to include the appropriate Ethminer arguments

Initial setup - Edit the .bat file variables (at the top) to point to Ethminer & MSI afterburner

Initial setup - Create shortcut, edit it's properties to run as admin

Initial setup - Set standard OC profile as profile 4

Initial setup - Set mining OC profile as profile 5


1. Run the loader 
   - Afterburner profile 5 enabled
   - Ethminer started 
   - If ethminer crashes, it will be restarted after one minute

2. To quit, kill the Ethminer window
   - script will detect ethminer is closed and reset overclock to profile 4
   - for one min the script can be closed 
   - if script isn't closed in the minute it will reset the mining OC profile (5) and restart ethminer
