/* global $, fetch, console */
/* eslint no-undef: "error", semi: 2 */
/* jshint esversion: 6 */

'use strict';

const {
  src,
  dest,
  parallel,
  series,
  watch
} = require('gulp');

const htmlmin = require('gulp-htmlmin');
const inlinesource = require('gulp-inline-source');
const rename = require('gulp-rename');
const browserSync = require('browser-sync').create();
const sass = require('gulp-sass');

function sassCompile () {
  return src('./gh-pages/sass/**/main.scss')
    .pipe(sass({ outputStyle: 'compressed' }).on('error', sass.logError))
    .pipe(rename('main.min.css'))
    .pipe(dest('./gh-pages/css'));
}

function minify () {
  return src('./gh-pages/*.src.html')
    .pipe(inlinesource())
    .pipe(htmlmin({
      collapseWhitespace: true
    }))
    .pipe(rename('index.html'))
    .pipe(dest('./gh-pages/'));
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
  watch(['./gh-pages/**/*.html', '!./gh-pages/index.html'], series(sassCompile, minify, reload));
  watch(['./gh-pages/js/**/*.js'], series(sassCompile, minify, reload));
  watch(['./gh-pages/sass/**/*.scss'], series(sassCompile, minify, reload));
}

exports.default = parallel(serve, watchFiles);
exports.dev = parallel(serve, watchFiles);
