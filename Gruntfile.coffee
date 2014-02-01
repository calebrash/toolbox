module.exports = (grunt) ->
  config =
    pkg: "<json:package.json>"

    coffee:
      default:
        options:
          bare: yes
        files:
          "snowflake/app.js": ["snowflake/*.coffee"]

    watch:
      default:
        files: ["snowflake/*.coffee"]
        tasks: ["coffee"]

  grunt.initConfig config

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.registerTask "default", ["coffee"]
