# zips "rocket.ork" into another .ork file
# takes 1 argument: the name of the .ork file for "rocket.ork" to be zipped in

#I copied this code from AI; trust me it works
import zipfile
import sys

with zipfile.ZipFile(sys.argv[1], 'w') as zipf: # sys.argv[1] is argument passed during execution
    zipf.write ('rocket.ork', arcname = 'rocket.ork') # 'rocket.ork' is the file to zip
