#!/bin/bash

# Setup my instant-server using NPM and more

# Go to server folder
cd $CUSTOM_USER/server

# Install some NPM packages
npm i --save-dev gulp gulp-sass gulp-uglify browser-sync gulp-concat gulp-imagemin gulp-plumber imagemin imagemin-mozjpeg 
imagemin-pngquant

# Copy gulpfile-static.js
cp ../gulpfile-static.js gulpfile.js
