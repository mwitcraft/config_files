import os
from subprocess import run, PIPE

gitDir = "/home/mason/Git/"

# Step through each directory in gitDir
for file in os.listdir(gitDir):
    if(os.path.isdir(gitDir + file)):
        # Change directory to specified directory in gitDir
        os.chdir(gitDir + file)
        # print(gitDir + file)
        # Run 'git fetch --dry-run and capture stdout and sterr
        gitFetch = run(["git", "fetch", "--dry-run"], capture_output=True)
        # For some reason git directs output to sterr, but decode that
        gitFetch_out = str(gitFetch.stderr, "utf-8")
        # If a git fetch is available
        if gitFetch_out is not "":
            try:
                # Merge the changes and install the updated package
                gitPull = run(["git", "pull"])
                makepkg = run(["makepkg", "-si"])
            except:
                print("Error occured in: " + gitDir + file)
        else:
            print(gitDir + file + " is up to date")