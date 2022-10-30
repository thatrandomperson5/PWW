import os
from os import listdir
from os.path import isfile, join


def makelines(chunks):
  for key, value in chunks.items():
    yield f"## {key}\n"
    for v in value:
      yield f"* [Cpython {v['version']} libv-{v['libv']}]({v['path']})\n"
    
PATH = os.getcwd() + "/builds/"
chunks = {}
for f in os.listdir(PATH):
  if isfile(join(PATH, f)):
    parts = f.split("-")
    name = parts[0]
    if not name in chunks:
      chunks[name] = []
    struct = {
      "path": "https://github.com/thatrandomperson5/PWW/raw/main/builds/" + f,
      "libv": parts[1],
      "version": (
        "3." + parts[2][3:]
      )
    }
    chunks[name].append(struct)

with open("README.md") as f:
  lines = f.readlines()
nlines = []
for line in lines:
  
  nlines.append(line)
  if line == "<!-- Automation line a81dad5e-102b-4207-9b48-1cc90fee7655-->\n":
    break
nlines = nlines + list(makelines(chunks))
print("".join(nlines))
with open("README.md", "w") as f:
  f.write("".join(nlines))
