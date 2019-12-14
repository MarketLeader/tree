#!/bin/bash
# Update npm to the latest
sudo npm install npm@latest -g

# Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps
# Referrence: https://fb.me/react-derived-state
echo -e "\n$hr\nNPX REACT\n$hr"
rm -rf graphiql.css package-lock.json yarn.lock
npx react-codemod rename-unsafe-lifecycles

# Delete all regenerated files
echo -e "\n$hr\nINSTALL\n$hr"
npm i -D babel-loader @babel/preset-env @babel/preset-react
npm i -D webpack webpack-cli webpack-dev-server
npm i -D html-loader html-webpack-plugin
touch webpack.config.js
touch .babelrc
npx webpack
