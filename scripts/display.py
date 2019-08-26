import sys
import os
from subprocess import run

#print(sys.argv)

if len(sys.argv) != 2:
    print("\tUsage: 'display [arg]'\n\tFor Help: 'display help'")
    exit()

option = sys.argv[1]

if option == "help":
    print("display [arg]")
    print("\thome:\tHome setup that enables external monitor and disables laptop display")

if option == "home":
    run(["./display_options/home.sh"])
