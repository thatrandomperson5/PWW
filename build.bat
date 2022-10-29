for /f "delims=" %%A in (pkgs.txt) do (
pip download %%A -d "/output" --no-deps --no-binary :all:
pip wheel -w /builds /output/ 
)
