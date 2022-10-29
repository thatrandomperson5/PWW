@echo off

for /f "delims=" %%A in (pkgs.txt) do (
    echo Downloading %%A
    pip download %%A -d "/output" --no-deps --no-binary :all:
    for %%f in (/output/*.tar.gz) do (
        set archive=%%f
        call :process %%A
    )
)

:process
echo Archive located: %archive%
tar -xvzf "/output/%archive%"
del "/output/%archive%"
echo Building %1
pip wheel -w /builds "/output/%archive:0,-7%/"
del "/output/*.*"
