HexDump
=======

``HexDump`` is a simple Windows utility to dump a file, or part of a file, in hexadecimal.

I use Linux, a lot, and I've come to love the ``hexdump`` utility that is found there. I frequently needed one on Windows at work, and so I went hunting for a decent hexdump utility. 

I eventually found some C code written by *Paul Edwards* (with modifications by *Bob Stout*) which they had put into the public domain. It worked well, but I've since fixed a couple of foibles.

Compiling
---------

If you have the excellent Embarcadero C++ 10.1 compiler, then there's a build file in the ``release`` and ``debug`` folders that will build the code for you. You can get the compiler free (for all time) from `Embarcadero Free Tools <https://www.embarcadero.com/free-tools>`__. Sign up for an account, download, unzip, add ``bin`` to ``%PATH%``. That's it!

If you have another compiler, then do whatever you must to compile a single C file into an executable. I have not tried any other Windows C compilers, I'm a big fan of the old Borland Tools and don't use anything else. (Well, ``GCC`` of course, on Linux!)

Possibly the following will work::

    cd SourceCode\HexDump\Release
    your_compiler_name -o HexDump.exe ..\HexDump\HexDump.c
    
Where 'your_compiler_name' is what you use to call your compiler on the command line.


Execution
---------

Once compiled, the utility is simple to use:

To get help::

    hexdump

To dump a complete file::

    hexdump file_name
    
To dump part of a file, to the end, from a given start position::

    hexdump file_name start_pos
    
    
To dump so many bytes, from a given position::

    hexdump file_name start_pos length

Output is to the screen, but can easily be redirected to a file as follows::

    hexdump file_name > file_name.hex.txt
    
    
Start and Length Parameters
---------------------------

Start and Length can be specified in three different ways:

- Decimal, for example, 123456 or 1024 etc.
- Octal, for example, 01234 or 067 - it's the leading zero that says 'octal'.
- Hexadecimal, for example, 0x1234 or 0xDEADBEEF or 0xC0FFEE, The leading '0x' says 'hex please'. And that's a leading zero not an 'OH'.

They can of course be mixed and don't have to be both in the same number base::

    hexdump file_name 0x3c00 256

    
Output Format
-------------

The format iof the output resembles the following, which is the first 128 bytes of the utility itself::

    00000000  4D5A5000 02000000 04000F00 FFFF0000  MZP.............
    00000010  B8000000 00000000 40001A00 0000FB75  ........@......u
    00000020  6A720000 00000000 00000000 00000000  jr..............
    00000030  00000000 00000000 00000000 00020000  ................
    00000040  BA10000E 1FB409CD 21B8014C CD219090  ........!..L.!..
    00000050  54686973 2070726F 6772616D 206D7573  This program mus
    00000060  74206265 2072756E 20756E64 65722057  t be run under W
    00000070  696E3332 0D0A2437 00000000 00000000  in32..$7........

At the start of each line is the offset into the file where the data are being dumped from, then there are 4 groups of 4 bytes which represent the data bytes in the file, and finally, the ASCII representation of the 16 bytes. Unprintable characters are replaced by a dot in the output - which does mean that a valid dot (0x2e) will look unprintable too. *C'est la  vie* as they say in Wales!

If a line is incomplete, and not an exact multiple of 16 bytes, you get a truncated line as follows::

    00000000  4D5A5000 02000000 04000F00 FFFF0000  MZP.............
    00000010  B8000000 0000                        ......

This is the first 22 bytes of the utility.        


Enjoy.