@echo off
for /f "delims=" %%A in (pkgs.txt) do (
echo Downloading %%A
pip download %%A -d "/output" --no-deps --no-binary :all:
for %%f in (/output/*.tar.gz) do (
  set archive=%%f
  goto exit
)
:exit
echo Archive located: %archive%
tar xvfz "/output/%archive%"
del "/output/%archive%"
echo Building %%A
pip wheel -w /builds /output/ 
)
