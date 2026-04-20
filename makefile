# name
name = versionflag

docdir = ~/numlims.github.io/versionflag/
docmake = ~/numlims.github.io

# get the version from github tag
# delete the v from the version tag cause python build seems to strip it as well
version = $(shell git tag | tail -1 | tr -d v)

all:
	ct versionflag/init.ct
	ct versionflag/main.ct

build:
	make
	python3 -m build --no-isolation

install:
	make build
	pip install "./dist/${name}-${version}-py3-none-any.whl" --no-deps --force-reinstall

.PHONY: test
test:
	make install
	pytest -s

doc:
	make
	pdoc "./${name}" -o html

doc-publish:
	make doc
	cp -r html/* ${docdir}
	cd ${docmake} && make publish

publish:
	make build
	# move the version tag to the most recent commit
	git tag -f "v${version}"
	# delete tag on remote
	git push origin ":refs/tags/v${version}" 
	# re-push the tag to the remote
	git push --tags
	gh release create "v${version}" "./dist/${name}-${version}-py3-none-any.whl"

publish-update: # if an asset was already uploaded, delete it before uploading again
	make build
	# does the tag updating also update the source code at the resource?
	# move the version tag to the most recent commit
	git tag -f "v${version}"
	# delete tag on remote
	git push origin ":refs/tags/v${version}" 
	# re-push the tag to the remote
	git push --tags
	gh release delete-asset "v${version}" "${name}-${version}-py3-none-any.whl" -y
	gh release upload "v${version}" "./dist/${name}-${version}-py3-none-any.whl"
	# apparently the tag change rolled the release back to draft, set it to publish again
	gh release edit "v${version}" --draft=false
