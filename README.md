# Blog do alphabraga

Para iniciar o site basta criar a imagem

    sudo docker build -t blog .

Em seguida rodar o container baseado na imagem

    sudo docker run -p8000:8000 -v=$(pwd)/:/var/www/html/ -dit blog

Entrar no container e rodar

    composer update

Entrar no container e rodar

    ./vendor/bin/jigsaw serve --host=0.0.0.0
