var gulp   = require('gulp');
var raml   = require('gulp-raml');
var notify = require('gulp-notify');
var concat = require('gulp-concat');
var debug  = require('gulp-debug');
var yaml   = require('js-yaml');

gulp.task('convert-raml-to-yaml', ['validate-raml'], function() {
  return gulp.src('./apis/*.raml', { base: './' })
  .pipe(raml2yaml())
  .pipe(gulp.dest('./.tmp'))
})

function raml2yaml(options) {
  var path = require('path');
  var gutil = require('gulp-util');
  var through = require('through2');
  var raml2html = require('raml2html');

  var simplifyMark = function(mark) {
    if (mark) {
      mark.buffer = mark.buffer.split('\n', mark.line + 1)[mark.line].trim();
    }
  }

  var options = {}
  options.type = 'yaml'
  options.config = {
    template: function(obj) {
      return yaml.safeDump(obj, {skipInvalid: true});
    }
  };
  options.extension = '.yaml'

  var stream = through.obj(function(file, enc, done) {
    var fail = function(message) {
      done(new gutil.PluginError('raml2html', message));
    };
    if (file.isBuffer()) {
      var cwd = process.cwd();
      process.chdir(path.resolve(path.dirname(file.path)));
      raml2html.render(file.contents, options.config,
        function(output) {
          process.chdir(cwd);
          stream.push(new gutil.File({
            base: file.base,
            cwd: file.cwd,
            path: gutil.replaceExtension(file.path, options.extension),
            contents: new Buffer(output)
          }));
          done();
        },
        function(error) {
          process.chdir(cwd);
          simplifyMark(error.context_mark);
          simplifyMark(error.problem_mark);
          process.nextTick(function() {
            fail(JSON.stringify(error, null, 2));
          });
        });
    }
    else if (file.isStream()) fail(
      'Streams are not supported: ' + file.inspect()
    );
    else if (file.isNull()) fail('Input file is null: ' + file.inspect());
  });

  return stream;
}

function handleError(err) {
  console.error(err.toString());
  this.emit('end');
}
