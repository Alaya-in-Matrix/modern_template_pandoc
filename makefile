SOURCE=report.md
OUTPUT=report.pdf
LANGUAGE=it
SETTINGS_FILE='settings.tex'
# Options are pygments (the default), kate, monochrome, espresso, zenburn, haddock, and tango
HIGHLIGHT=haddock
# Font specs
MAINFONT='Noto Sans CJK SC'
SANSFONT='PT Sans'
MONOFONT='DejaVu Sans Mono'
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
			-V lang=${LANGUAGE} 				  \
			-V theme:m 							  \
			-o ${OUTPUT}	 					  \
			$<
	@echo "All done!"

.PHONY: clean

clean:
	rm -rf *.pdf
