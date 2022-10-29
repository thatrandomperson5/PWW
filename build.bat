@echo off
setlocal enabledelayedexpansion

for /f "delims=" %%A in (pkgs.txt) do (
    echo Downloading %%A
    pip download "%%A" -d "\output" --no-deps --no-binary :all:
    >output.tmp dir /b \output\*.tar.gz
    <output.tmp set /p "pkg="
    del output.tmp
    call :process %%A !pkg!
)

:process
set "archive=%~2"
echo Archive located: %archive%
:: tar -xvzf "\output\%archive%"
:: del "\output\%archive%"
echo Building %1
:: pip wheel -w=\builds "\output\%archive:~0,-7%\"
pip wheel --wheel-dir="/builds/" "\output\%archive%"
del /F /Q "\output\*.*"
