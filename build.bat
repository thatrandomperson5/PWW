@echo off
for /f "delims=" %%A in (pkgs.txt) do (
echo Downloading %%A
pip download %%A -d "/output" --no-deps --no-binary :all:
for %%f in (*.tar.gz) do (
  set archive=%%f
  goto exit
)
:exit
echo %archive%
tar xvfz %archive%
del %archive%
echo Building %%A
pip wheel -w /builds /output/ 
)
