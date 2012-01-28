server:
	@@jekyll --server

render:
	@@echo "Building the site..."
	@@jekyll --no-future
	
minify:
	@@echo "Minifying the CSS..."
	@@java -jar _build/yuicompressor.jar --verbose --type css -o _site/assets/css/style.css _site/assets/css/style.css
	@@echo "Minifying the HTML..."
	@@java -jar _build/htmlcompressor.jar --type html -o _site _site

build: render minify
	# Add an rsync command to put the _site directory on the production server

deploy: build

.PHONY: server render build minify deploy