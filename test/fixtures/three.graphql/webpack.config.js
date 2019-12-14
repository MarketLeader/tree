const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const PORT = 8118;
module.exports = {
  target: 'node',
  mode: 'development',
  devtool: 'source-map',
  entry: path.join(__dirname, './index.js'),
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.m?js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      },
      {
        test: /\.(html)$/,
        use: {
          loader: 'html-loader',
          options: {
            attrs: [':data-src']
          }
        }
      }
    ]
  },
  devServer: {
    contentBase: 'dist',
    liveReload: false,
    port: PORT
  }
};
