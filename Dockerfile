# #####  STAGE 1: BUILD######

# FROM node:10-alpine
# COPY package.json package-lock.json ./
# ## Storing node modules on a separate layer will prevent unnecessary npm installs at each build
# RUN npm ci && mkdir /ng-app && mv ./node_modules ./ng-app
# WORKDIR /ng-app
# COPY . .
# ## Build the angular app in production mode and store the artifacts in dist folder
# ARG ENV=dev
# ## Build the angular app in production mode and store the artifacts in dist folder
# #RUN npm run ng build -- --configuration=$ENV --output-path=dist
# RUN npm run ng build --aot --buildOptimizer --output-path=dist


# ####   STAGE 2: NGINX SETUP #######

# FROM nginx:1.14.1-alpine
# COPY --from=0 /ng-app/dist /usr/share/nginx/html
# CMD ["nginx","-g","daemon off;"]






FROM node:10-alpine
COPY package.json package-lock.json ./
RUN npm install
WORKDIR /app
COPY . .
CMD ["npm","run","start"]
