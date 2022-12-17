.PHONY: default all clean

TARGETS := praesentation.pdf

# TARGETS := praesentation.pdf handout.pdf

LATEX_BUILD_DIR := .latexmk

default: all

all: $(TARGETS)

praesentation.pdf: praesentation.tex
	latexmk -xelatex -pdf -output-directory=$(LATEX_BUILD_DIR) -silent -synctex=1 praesentation
	ln -sd $(LATEX_BUILD_DIR)/praesentation.pdf ./
	
# handout.pdf: handout.md
# 	pandoc $^ -o $@

clean:
	$(RM) -rf $(TARGETS) $(LATEX_BUILD_DIR)
