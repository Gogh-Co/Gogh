/* global $, fetch, console */
/* eslint no-undef: "error", semi: 2 */

'use strict';

const {
  src,
  dest,
  parallel,
  series,
  watch
} = require('gulp');

const htmlmin      = require('gulp-htmlmin');
const inlinesource = require('gulp-inline-source');
const rename       = require('gulp-rename');
const browserSync  = require('browser-sync').create();
const sass         = require('gulp-sass')(require('sass'));

function sassCompile () {
  return src('./sass/**/main.scss')
    .pipe(sass({ outputStyle: 'compressed' }).on('error', sass.logError))
    .pipe(rename('main.min.css'))
    .pipe(dest('./css'));
}

function minify () {
  return src('./*.src.html')
    .pipe(inlinesource())
    .pipe(htmlmin({
      collapseWhitespace: true
    }))
    .pipe(rename('index.html'))
    .pipe(dest('./'));
}

function serve () {
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
}

function reload (done) {
  browserSync.reload();
  done();
}

function watchFiles () {
  watch(['./**/*.html', '!./index.html'], series(sassCompile, minify, reload));
  watch(['./js/**/*.js'], series(sassCompile, minify, reload));
  watch(['./sass/**/*.scss'], series(sassCompile, minify, reload));
}

exports.default = parallel(serve, watchFiles);
exports.dev = parallel(serve, watchFiles);
