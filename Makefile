# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SPHINXMULTIVERSION ?= sphinx-multiversion
SOURCEDIR     = .
BUILDDIR      = _build
WEB_DOCS_BUILDER_URL ?= https://ai.b-bug.org/~zhengshanshan/web-docs-builder

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile _static/init_mermaid.js _static/topbar.css _static/custom-theme.css _templates/versionsFlex.html _templates/layout.html
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

mhtml: _static/init_mermaid.js _static/topbar.css _static/custom-theme.css _templates/versionsFlex.html _templates/layout.html
	@$(SPHINXMULTIVERSION) "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

_templates:
	mkdir $@

_static/init_mermaid.js:
	@wget -q $(WEB_DOCS_BUILDER_URL)/$@ -O $@

_static/topbar.css:
	@wget -q $(WEB_DOCS_BUILDER_URL)/$@ -O $@

_static/custom-theme.css:
	@wget -q $(WEB_DOCS_BUILDER_URL)/$@ -O $@

_templates/versionsFlex.html: _templates
	@wget -q $(WEB_DOCS_BUILDER_URL)/$@ -O $@

_templates/layout.html: _templates
	@wget -q $(WEB_DOCS_BUILDER_URL)/$@ -O $@
