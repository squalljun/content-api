# Base
FROM node:alpine AS base
RUN apk -U add curl
WORKDIR /usr/src/app
EXPOSE 3001

# Build
FROM node:argon AS Build
WORKDIR /usr/src/app
COPY package.json /usr/src/app
RUN npm install
COPY . /usr/src/app

# final 
FROM base AS final
WORKDIR /usr/src/app
COPY --from=build /usr/src/app .
CMD ["npm", "start"]

