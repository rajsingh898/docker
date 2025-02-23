FROM ubuntu as build
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x  | bash - 
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
# till now we have added a base image of ubuntu on top of that we have installed node js
WORKDIR /app 
COPY package.json package.json
COPY package-lock.json package-lock.json 

RUN npm install 

COPY . . 
# copied all of my files of my application in image 

#  did not copy node modules as they are heavy so downloaded  it

FROM ubuntu as runner 
WORKDIR /app
COPY --from=build app/ .
ENTRYPOINT [ "node", "main.js" ]