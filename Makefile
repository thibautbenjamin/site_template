\_site: 
	jekyll build

	rsync -avz _site/ tbenjamin@login.lix.polytechnique.fr:".webdir/"
	git add -A
	git commit -m "update"
	git push
