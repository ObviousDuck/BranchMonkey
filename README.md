# BranchMonkey
A small utility to traverse directories and show info on these.


=== BEFORE STARTING === 

Please add permissions to run BranchMonkeyBasic.sh 

# chmod +x BranchMonkeyBasic.sh


The other two files have permissions written already, so there is no need to change any permissions on these.

=== VERSION CONTROL === 

BranchMonkeyBasic.sh will check to see if dialog is installed on the system, if not, it will continue the program. If dialog is installed, it will instead run BranchMonkey.sh, which is the full dialog based version (GUI). 

=== USER GUIDE ===

1. Traverse Current Directory
    Traverses the current working directory. This is shown at the top of the screen. As the directory changes, these changes       can be seen at the top. This uses BranchMonkeyTraverse.sh. 
    It will display directories and and the sizes of those directories and files. Shown in Bytes.  

2. Return to Parent Directory
    Returns user to the parent directory.

3. Return to Home Directory]
    Returns user to the home directory.

4. Return to Starting Directory
    Returns the user to the starting directory.

5. Choose Directory (Not available in BranchMonkeyBasic.sh)
    GUI Directory chooser. It will start from whichever directory is currently chosen. It is possible to type in the directory     that the user wishes to go to, or it can be selected from the list. It is possible to see the files within. 
