@echo off
echo ********cleaning old blogs and generate new ones********
./hCLean.bat
@REM if errorlevel neq 0 (
@REM     echo errorlevel为%errorlevel%
@REM     pause
@REM )
./hG.bat
hexo d||echo ********NETWORK ERROR***Please Check VPN Connection********