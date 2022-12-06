FROM node:19-buster-slim
 
# 開発ディレクトリ設定
WORKDIR /shark
COPY ./package*.json ${WORKDIR}/

# RUN npm install axios
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "curl"]

COPY ./app ${WORKDIR}/

RUN ["npm", "install", "-g", "npm@9.1.3"]
RUN ["npm", "ci"]
CMD ["npm", "run", "dev", "--", "--port", "8080"]