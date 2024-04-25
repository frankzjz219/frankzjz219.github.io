@echo off
echo Running hexo clean...
hexo clean
if %errorlevel% neq 0 (
    echo WARNING: hexo clean failed!
    goto END
) else (
    echo hexo clean success!
)
echo Running hexo generate...
hexo generate
if %errorlevel% neq 0 (
    echo WARNING: hexo generate failed!
    goto END
) else (
    echo hexo generate success!
)
echo Running hexo deploy...
hexo deploy
if %errorlevel% neq 0 (
    echo WARNING: hexo deploy failed!
    goto END
) else (
    echo hexo deploy success!
)
echo All commands completed!
:END
pause