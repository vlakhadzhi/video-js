#! /bin/csh
# Combines Source Files. In terminal, sh build.sh
# It will put a new video.js file under dist/

# Create dist directory if it doesn't already exist
mkdir -p dist

# FILES=../src/*
# for f in $FILES
# do
#   echo "Processing $f file..."
#   # take action on each file. $f store current file name
#   cat $f
# done

cat src/_begin.js > dist/video.js
echo >> dist/video.js

cat src/core.js >> dist/video.js
echo >> dist/video.js
cat src/lib.js >> dist/video.js
echo >> dist/video.js
cat src/ecma.js >> dist/video.js
echo >> dist/video.js
cat src/json.js >> dist/video.js
echo >> dist/video.js
cat src/events.js >> dist/video.js
echo >> dist/video.js

cat src/component.js >> dist/video.js
echo >> dist/video.js
cat src/player.js >> dist/video.js
echo >> dist/video.js
cat src/tech.js >> dist/video.js
echo >> dist/video.js
cat src/controls.js >> dist/video.js
echo >> dist/video.js

cat src/tracks.js >> dist/video.js
echo >> dist/video.js
cat src/popup.js >> dist/video.js
echo >> dist/video.js

# h5swf temporarily requires swfobject
# cat flash/swfobject.js >> dist/video.js

cat src/setup.js >> dist/video.js
echo >> dist/video.js
cat src/_end.js >> dist/video.js


# Copy Files
cp design/video-js.css dist/video-js.css
cp design/video-js.png dist/video-js.png
cp flash/video-js.swf dist/video-js.swf

cp build/release-files/README.md dist/README.md
cp build/release-files/demo.html dist/demo.html
cp LGPLv3-LICENSE.txt dist/LGPLv3-LICENSE.txt

java -jar build/lib/yuicompressor-2.4.7.jar dist/video.js -o dist/video.min.js
java -jar build/lib/yuicompressor-2.4.7.jar dist/video-js.css -o dist/video-js.min.css

##########################################################################
# wiley-player
##########################################################################

set dist_dir = dist
set wiley_player_js_dir = wiley-player/js
set wiley_player_js_list = "LGPLv3-LICENSE.txt README.md video-js.min.css video-js.png video-js.swf video.min.js video.js video-js.css"
set videojs_dist_name = video-js.tar.bz2
set wiley_player_dist_list = "build build.sh decisions.txt demo-subtitles.srt design dev dev.html.example docs flash LGPLv3-LICENSE.txt Rakefile README.md source-list.js src tech test VERSION.yml"

if (! -d $wiley_player_js_dir) then
	mkdir -p $wiley_player_js_dir
endif

foreach file ($wiley_player_js_list)
	cp $dist_dir/$file $wiley_player_js_dir
end

#tar cjf $wiley_player_js_dir/$videojs_dist_name $wiley_player_dist_list
