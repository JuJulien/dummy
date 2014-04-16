module.exports =
  options:
    livereload: '<%= in8.liveport %>'

  html:
    files:[
      '<%= in8.htmlSrc %>/**/*.html'
      '<%= in8.htmlSrc %>/**/*.tmpl'
    ]

  sass:
    files:'<%= in8.cssSrc %>/*.scss'
    tasks: [
      'sass:build',
      'autoprefixer:build'
    ]
  images:
    files:[
      '<%= in8.imgSrc %>/**'
    ]
  coffee:
    files: '<%= in8.jsSrc %>/*.coffee'
    tasks: [
      'coffee:build'
    ]
  coffeeCompile:
    files: '<%= in8.compSrc %>/*.coffee'
    tasks: [
      'coffee:compile'
    ]
