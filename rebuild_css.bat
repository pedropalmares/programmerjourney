cd .\themes\ghostwriter\
call npm run build
cd ..\..
hugo gen chromastyles --style=monokai > themes\ghostwriter\static\dist\syntax.css
hugo
hugo serve