/*
  ./config/webpack/environment.js
  Info for this file can be found
  github.com/rails/webpacker/blob/master/docs/webpack.md
*/

const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
        $: 'jquery',
        JQuery: 'jquery',
        jquery: 'jquery',
        "window.jQuery": "jquery",
        Popper: ['popper.js', 'default'], // for Bootstrap 4
    })
)

const config = environment.toWebpackConfig()

config.resolve.alias = {
        jquery: "jquery/src/jquery"
}

// export the updated config
module.exports = environment