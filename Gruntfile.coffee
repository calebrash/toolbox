module.exports = (grunt) ->
  config =
    pkg: "<json:package.json>"

    coffee:
      default:
        options: {}
        files:
          "snowflake/app.js": ["snowflake/*.coffee"]
          "color-mixer/app.js": ["color-mixer/*.coffee"]
          "tic-tac-toe/app.js": ["tic-tac-toe/*.coffee"]

    watch:
      default:
        files: ["snowflake/*.coffee", "color-mixer/*.coffee", "tic-tac-toe/*.coffee"]
        tasks: ["coffee"]

  grunt.initConfig config

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.registerTask "default", ["coffee"]
