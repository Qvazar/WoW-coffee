var gulp = require('gulp'),
	coffee = require('gulp-coffee'),
	sourcemaps = require('gulp-sourcemaps'),
	uglify = require('gulp-uglify'),
	concat = require('gulp-concat');

gulp.task('coffee', function() {
	gulp.src('client/scripts/**/*.coffee')
		.pipe(sourcemaps.init())
		.pipe(coffee())
		.pipe(sourcemaps.write())
		.pipe(gulp.dest('build/dev/client/scripts'))
		.pipe(uglify())
		.pipe(gulp.dest('build/dist/client/scripts'));
});

gulp.task('js-libs', function() {
	gulp.src([
		'bower_components/requirejs/require.js'
		])
		.pipe(concat('libs.js'))
		.pipe(gulp.dest('build/dev/client/scripts'))
		.pipe(uglify())
		.pipe(gulp.dest('build/dist/client/scripts'));
});