'use strict';

const gulp        = require('gulp');

const htmlmin      = require('gulp-htmlmin');
const inlinesource = require('gulp-inline-source');
const rename       = require("gulp-rename");
const browserSync  = require('browser-sync').create();


gulp.task('minify', () => {
  return gulp.src('./*.src.html')
    .pipe(inlinesource())
    .pipe(htmlmin({ collapseWhitespace: true }))
    .pipe(rename("index.html"))
    .pipe(gulp.dest('./'));
});

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
  gulp.watch(['./**/*', '!./index.html'], { interval: 800 }, ['minify', 'reload']);
});

gulp.task('default', ['watch']);

gulp.task('dev', ['watch']);
