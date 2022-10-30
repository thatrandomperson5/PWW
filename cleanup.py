import re, os
from os.path import isfile, join
PATH = os.getcwd() + "/builds/"
pattern = re.compile(".*-[0-9].[0-9].[0-9]-.*-win_amd64.whl")
for f in os.listdir(PATH):
  item = join(PATH, f)
  if isfile(item):
    if not pattern.match(f):
      os.remove(item)
      #print("Will remove", item)
