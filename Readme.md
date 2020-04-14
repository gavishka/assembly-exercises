How to Create a New MASM Project in Visual Studio 10

1) Create a Blank Visual Studio Solutions Project.
File -> New -> Project -> Other Project Types -> Visual Studio Solutions -> Blank Solution
a) Enter a project name, change the folder location if necessary, press OK

2) Create an Empty C++ Project
File -> Add -> Project -> Visual C++ -> General -> Empty Project
a) Enter an application name and press OK.

3) Configure the Project to recognize MASM.
a) From the Application name, right click to open Dialog Box Menu and select Build Customization
b) Select MASM (check it) and click OK.

4) Create an empty source code file
Add -> New Ite -> Visual C++ -> Text file
a) Enter a file name which ends with .asm

5) Change the configuration settings.
a) From the Application name, right click and select Properties.
a. Linker -> General -> Additional Library Directories = C:\Irvine
b. Linker -> Input -> Additional Dependencies -> {Edit} add irvine32.lib
c. Linker -> System -> SubSystem pull down choices and select Console
d. Microsoft Macro Assembler -> Include Path add C:\Irvine
You should now have a working IRVINE MASM Project.
