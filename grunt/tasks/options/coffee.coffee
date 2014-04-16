module.exports =
  build:
    options:
      sourceMap: true
    expand: true
    flatten: true
    cwd: '<%= in8.jsSrc %>'
    src: ['*.coffee']
    dest: '<%= in8.jsDest %>'
    ext: '.js'

  compile:
    expand: true
    cwd: '<%= in8.compSrc %>'
    src: ['*.coffee']
    dest: '<%= in8.compDest %>'
    ext: '.js'