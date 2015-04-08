var requireDir = require('require-dir');
var dir = requireDir('./tasks');
var gulp = require('gulp');

gulp.task('default', [
  'convert-raml-to-json',
  'convert-raml-to-yaml',
  'convert-raml-to-html',
], function() {
  return true
})

gulp.task('mkdir-src', function() {
  var mkdirp = require('mkdirp')

  mkdirp('./.tmp')

  return gulp.src('./')
})
