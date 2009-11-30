Everything you need should be in the tool chain.zip file.

The file consists of various GNU tools, the MIPS communication server and some batch files to build and run programs for you.

build.bat is passed a single parameter, the name of a file to build.  Assembly files must end in a large S extension otherwise they won't get passed through the C preprocessor

run.bat is also passed a single parameter, the executable to run on the board.  The build script produces prog.elf which is an executable, so to run what you've just built call run.bat prog.elf

The MIPS Communication Server program must be running in order for run.bat to work.  When you start it first select a cable and then a device using the combo box and list box, then click connect.  Once it has connected sucessfully the 'Not Connected' text will change to 'Connected to ...'.  Click the Log button to see a log of what's happen and disconnect to disconnect.  To quit the program right click the tray icon and choose close.

If things aren't working close down the comm server, reprogram the board and bring the comm server back up again.

JTAGTerminal provides a simple terminal, you must pass it the name of a cable, usually this will be USB-Blaster [USB-0].  So run it as 'JTAGTerminal "USB-Blaster [USB-0]"'