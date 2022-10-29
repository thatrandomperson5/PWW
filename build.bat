@echo off
for /f "delims=" %%A in (pkgs.txt) do (
pip download %%A -d "/output" --no-deps --no-binary :all:
for %%f in (*.tar.gz) do (
  set archive=%%f
  goto exit
)
:exit
tar xvfz %archive%
del %archive%
pip wheel -w /builds /output/ 
)
