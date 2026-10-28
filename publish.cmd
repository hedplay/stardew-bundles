@echo off
cd /d "%~dp0"
echo === Публикация сайта на GitHub Pages ===
echo.

git add -A
git diff --cached --quiet
if not errorlevel 1 (
  echo Изменений нет - публиковать нечего.
  goto :end
)

git commit -m "Update site %date% %time%"
if errorlevel 1 goto :fail

git push
if errorlevel 1 goto :fail

echo.
echo Готово. Обычно сайт обновляется за 1-2 минуты, иногда до 10 минут (кэш GitHub) - обновите с Ctrl+F5:
echo https://hedplay.github.io/stardew-bundles/
goto :end

:fail
echo.
echo Не удалось опубликовать. Проверьте интернет и вход в GitHub (gh auth status).

:end
echo.
pause
