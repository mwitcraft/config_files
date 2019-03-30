import os

gitDir = "/home/mason/Git/"


import subprocess
# p = subprocess.Popen("pwd", stdout=subprocess.PIPE)
# result = p.communicate()[0]
# print(str(result))

# p = subprocess.run(['echo', "hello world"], stdout=subprocess.PIPE)
# print(p.stdout)

for file in os.listdir(gitDir):
    if(os.path.isdir(gitDir + file)):
        os.chdir(gitDir + file)
        p = subprocess.run(["git", "status", "-s"], stdout=subprocess.PIPE)
        print(str(p.stdout, "utf-8"))
    else:
        print(file)