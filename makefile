SOURCE=report.md meta.yaml
OUTPUT=report
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
.PHONY: pdf
.PHONY: html
.PHONY: latex

default:pdf
pdf:${OUTPUT}.pdf
latex:${OUTPUT}.tex
html:${OUTPUT}.html

${OUTPUT}.html:${SOURCE}
	@echo "Compiling"
	pandoc 	-t html 							    \
			--highlight-style=${HIGHLIGHT}          \
			-s                                      \
			--template=template.html                \
			-V mainfont=${MAINFONT}                 \
			-V sansfont=${SANSFONT}                 \
			-V monofont=${MONOFONT}                 \
			-V CJKmainfont=${CJKMAINFONT}           \
			-o $@                                   \
			$^
	@echo "All done!"
${OUTPUT}.pdf:${SOURCE}
	@echo   "Compiling"
	pandoc 	-t beamer --latex-engine=xelatex        \
			--highlight-style=${HIGHLIGHT}          \
			-s                                      \
			-H ${SETTINGS_FILE}                     \
			--template=${TEMPLATE}                  \
			-V mainfont=${MAINFONT}                 \
			-V sansfont=${SANSFONT}                 \
			-V monofont=${MONOFONT}                 \
			-V CJKmainfont=${CJKMAINFONT}           \
			-V theme:m                              \
			-o $@                                   \
			$^
	@echo "All done!"

${OUTPUT}.tex:${SOURCE}
	@echo   "Compiling"
	pandoc 	-t beamer --latex-engine=xelatex        \
			--highlight-style=${HIGHLIGHT}          \
			-s                                      \
			-H ${SETTINGS_FILE}                     \
			--template=${TEMPLATE}                  \
			-V mainfont=${MAINFONT}                 \
			-V sansfont=${SANSFONT}                 \
			-V monofont=${MONOFONT}                 \
			-V CJKmainfont=${CJKMAINFONT}           \
			-V theme:m                              \
			-o $@                                   \
			$^ 
	@echo "All done!"

.PHONY: clean

clean:
	rm -rf ${OUTPUT}.pdf
	rm -rf ${OUTPUT}.tex
