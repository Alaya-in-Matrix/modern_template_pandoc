SOURCE=report.md
OUTPUT=report.pdf
SETTINGS_FILE='settings.tex'
# Options are pygments (the default), kate, monochrome, espresso, zenburn, haddock, and tango
HIGHLIGHT=haddock
# Font specs
MAINFONT='Noto Sans'
SANSFONT='Noto Sans'
MONOFONT='Noto Mono'
CJKMAINFONT='Noto Sans CJK SC'
TEMPLATE=template.tex

.PHONY: default

${OUTPUT}:${SOURCE}
	@echo   "Compiling"
	@pandoc 	-t beamer --latex-engine=xelatex  \
			--highlight-style=${HIGHLIGHT} 	      \
			-H ${SETTINGS_FILE} 				  \
			--template=${TEMPLATE}				  \
			-V mainfont=${MAINFONT} 			  \
			-V sansfont=${SANSFONT} 			  \
			-V monofont=${MONOFONT} 			  \
			-V CJKmainfont=${CJKMAINFONT}         \
			-V theme:m 							  \
			-o ${OUTPUT}	 					  \
			$<
	@echo "All done!"

.PHONY: clean

clean:
	rm -rf *.pdf
