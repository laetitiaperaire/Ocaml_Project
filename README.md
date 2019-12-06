Base project for Ocaml project on Ford-Fulkerson. This project contains some simple configuration files to facilitate editing Ocaml in VSCode.

To use, you should install the *OCaml* extension in VSCode. Other extensions might work as well but make sure there is only one installed.
Then open VSCode in the root directory of this repository.

Features :
 - full compilation as VSCode build task (Ctrl+Shift+b)
 - highlights of compilation errors as you type
 - code completion
 - automatic indentation on file save


A makefile also provides basic automation :
 - `make` to compile. This creates an ftest.native executable

 - `make format` to indent the entire project
 
 ----------------------------------------------------------------------------------------------------------------------------------------------------

Project by Laetitia Peraire and Marie Laur 

In order to test the Ford-Fulkerson algorithm (after building), use :
- `./ftest.native graphs/graph1 0 0 graphs/graphfinal`

The graphfinal file contains a representation of the graph1 after using the algorithm, each arc with the maximum flow.
To create an svg image of the graph use :

- `dot -Tsvg graphs/graph_ford.txt > graphs/graph_ford.svg`