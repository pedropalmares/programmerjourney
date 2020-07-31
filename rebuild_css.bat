cd .\themes\ghostwriter\
call yarn
call yarn run build
cd ..\..
hugo gen chromastyles --style=monokai > themes\ghostwriter\static\dist\syntax.css
hugo
hugo serve