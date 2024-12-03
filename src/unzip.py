# extract a zip file to the directory of this program
# takes 1 argument: the path to the zip file to be unzipped

#I copied this code from AI; trust me it works
import zipfile
import sys

# Specify the path to your ZIP file
# sys.argv[1] is the argument passed during execution
zip_file_path = sys.argv[1]
# Specify the directory where you want to extract the files
# ./ refers to the directory containing this program
extract_to_path = './'

# Create a ZipFile object
with zipfile.ZipFile(zip_file_path, 'r') as zip_ref:
    # Extract all the contents into the specified directory
    zip_ref.extractall(extract_to_path)
