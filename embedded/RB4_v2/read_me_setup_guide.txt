1) Right-Click Project
2) Choose "Properties"
3) Choose "CCS Builed" > "Arm Compiler" > "Include Options"

4) Double Click each of the two directories: 

	"C:\Users\linax\git\pan_tilt_control_system\embedded\frt10\port\TivaM4"
	"C:\Users\linax\git\pan_tilt_control_system\embedded\frt10\inc"

5) If your git-repo is placed in the root or your pc -- change to your own user-id:

	C:\Users\{user}\git\pan_tilt_control_system\embedded\frt10\port\TivaM4
	C:\Users\{user}\git\pan_tilt_control_system\embedded\frt10\inc
    
   Otherwise find the file-path for the git repo and change accordingly.

6) Click "Apply and Close" 
7) Right-Click Project> "Clean Project"
8) Right-Click Project> "Build Project"

or to run...
9) Right-Click Project> "Debug As" > "1 Code Composer Debug Session"