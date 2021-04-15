%:
	jupyter nbconvert --to markdown notebooks/$@.ipynb
	rm -rf assets/images/$@
	mv notebooks/$@_files assets/images/$@
	mv notebooks/$@.md _posts/$@.md
