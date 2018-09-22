'use strict';

const gulp = require('gulp');

const browserSync = require('browser-sync').create();

gulp.task('serve', function () {
  browserSync.init({
    port: 8890,
    reloadDelay: 500,
    ui: false,
    open: true,
    server: {
      baseDir: './',
      directory: true
    }
  });
});

gulp.task('reload', function (done) {
  browserSync.reload();
  done();
});

gulp.task('watch', ['serve'], function () {
  gulp.watch('./**/*', { interval: 800 }, ['reload']);
});

gulp.task('default', ['watch']);

gulp.task('dev', ['watch']);