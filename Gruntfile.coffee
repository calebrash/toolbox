module.exports = (grunt) ->
  config =
    pkg: "<json:package.json>"

    coffee:
      default:
        options: {}
        files:
          "snowflake/app.js": ["snowflake/*.coffee"]
          "color-mixer/app.js": ["color-mixer/*.coffee"]

    watch:
      default:
        files: ["snowflake/*.coffee", "color-mixer/*.coffee"]
        tasks: ["coffee"]

  grunt.initConfig config

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.registerTask "default", ["coffee"]
