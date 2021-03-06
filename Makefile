install:
	cd ui && npm install --no-package-lock

ui:
	cd ui && npm install --no-package-lock && npm run build

docs:
	cd ui && npm run build
	pip3 install -e .
	cd docs && make clean; make html

demo:
	cd ui && npm run build
	pip3 install -e .
	cd demo && make clean; make html

.PHONY: docs demo ui install Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
