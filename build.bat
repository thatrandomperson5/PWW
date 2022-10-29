for /f "delims=" %%A in (pkgs.txt) do (
pip download %%A -d "/output" --no-deps --no-binary :all:
tar xvfz "/output/*.tar.gz"
del "/output/*.tar.gz"
pip wheel -w /builds /output/ 
)
