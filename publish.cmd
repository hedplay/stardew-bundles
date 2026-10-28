@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo === Публикация сайта на GitHub Pages ===
echo.

git add -A
git diff --cached --quiet
if not errorlevel 1 (
  echo Изменений нет — публиковать нечего.
  goto :end
)

git commit -m "Обновление сайта %date% %time%"
if errorlevel 1 goto :fail

git push
if errorlevel 1 goto :fail

echo.
echo Готово. Сайт обновится через 1-2 минуты:
echo https://hedplay.github.io/stardew-bundles/
goto :end

:fail
echo.
echo Не удалось опубликовать. Проверьте интернет и вход в GitHub (gh auth status).

:end
echo.
pause
