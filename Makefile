serve:
	bundle exec jekyll serve

install:
	bundle install

%:
	jupyter nbconvert --to markdown notebooks/$@.ipynb
	sed -i 's:!\[png\](:!\[png\](/assets/images/:g' notebooks/$@.md
	sed -i '1s/^/---\ncategory: Algorithm\n---\n/' notebooks/$@.md
	rm -rf assets/images/$@_files
	mv notebooks/$@_files assets/images/$@_files
	mv notebooks/$@.md _posts/$@.md
