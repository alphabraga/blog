FROM php:7.4

RUN apt-get update && \
    apt-get install --yes \
    git \ 
    zip \ 
    curl

ENV NODE_VERSION=12.14.0
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

RUN curl -sS https://getcomposer.org/installer | \ 
    php -- --install-dir=/usr/local/bin \ 
    --filename=composer

WORKDIR /var/www/html

EXPOSE 8000