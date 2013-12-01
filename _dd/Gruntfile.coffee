module.exports = (grunt) ->
    config =
        pkg: "<json:package.json>"

        coffee:
            default:
                options:
                    bare: true
                files:
                    "dist/dd.js": "src/dd.coffee"

        uglify:
            default:
                files:
                    "dist/dd.min.js": "dist/dd.js"

        watch:
            default:
                files: ["src/dd.coffee"]
                tasks: ["coffee"],
            all:
                files: "src/dd.coffee"
                tasks: ["coffee", "uglify"]

    
    grunt.initConfig config

    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-uglify"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.registerTask "default", ["coffee", "uglify"]
