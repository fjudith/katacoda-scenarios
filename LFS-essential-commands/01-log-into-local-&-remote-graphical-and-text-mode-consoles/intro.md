## Log into local & remote graphical and text mode consoles

Basic concept to know:

* **Text Terminal**: text input/output environment.
  * Originally, they meant a piece of equipment through which you could interact with a computer: in the early days of Unix, that meant a teleprinter-style device resembling a typewriter, sometimes called a teletypewriter, or “tty” in shorthand
  * Tty were used to establish a connection to a mainframe computer and share operating system provided by it
  * A typical text terminal produces input and displays output and errors
* **Console**: terminal in modern computers that don't use mainframe but have an own operating system. It is generally a terminal in the physical sense that is, by some definition, the primary terminal directly connected to a machine.
  * The console appears to the operating system "like" a remote terminal
  * In Linux and FreeBSD, the console, in realty, appears as several terminals (*ttys*) called *Virtual Consoles*
* **Virtual Consoles**: to provide several text terminals on a single computer
  * Multiple virtual consoles can be accessed simultaneously
* **Shell**: command line interface or CLI
  * It is the primary interface that users see when they log in,  whose primary purpose is to start other programs
  * It is presented inside console
  * There are many different Linux shells
  * Command-line shells include flow control constructs to combine commands. In addition to typing commands at an interactive prompt, users can write shell scripts

To summarize: A virtual console is a shell prompted in a non-graphical environment, accessed from the physical machine, not remotely. 

* **Pseudo-terminal**: Terminal provided by programs called terminal emulators e.g. `ssh`, `tmux`
* **X Windows System**: is a windowing system for bitmap displays
  * X provides the basic framework for a graphical user interface (GUI) environment: drawing and moving windows on the display device and interacting with a mouse and keyboard
  * X does not mandate the user interface – this is handled by individual programs, like KDE or GNOME
  * It is considered "*graphical terminal*"
  * When is executed it will substitute one of the text terminal provided by virtual console. In CentOS the terminal will be 1, in other system could be 7.
  * Some applications running inside X Windows System provide pseudo-terminal e.g. Konsole, Gnome Terminal
  * If graphical environment is not started, you can run command `startx` to execute it