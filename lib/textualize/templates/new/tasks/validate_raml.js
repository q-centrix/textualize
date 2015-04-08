var gulp       = require('gulp');
var raml       = require('gulp-raml');
var debug      = require('gulp-debug');

gulp.task('validate-raml', function() {
  return gulp.src('apis/*.raml')

  .pipe(debug({title: 'checking raml file: '}))
  .pipe(raml())
  .pipe(raml.reporter('default'))
  .pipe(raml.reporter('fail'))
})

