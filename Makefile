server:
	@@jekyll --server

render:
	@@echo "Building the site..."
	@@jekyll --no-future
	
minify:
	@@echo "Minifying the CSS..."
	@@java -jar _build/yuicompressor.jar --verbose --type css -o _site/assets/css/style.css _site/assets/css/style.css
	@@echo "Minifying the HTML..."
	@@(cd _site ; java -jar ../_build/htmlcompressor.jar {} -o {})

build: render minify

.PHONY: server render build minify