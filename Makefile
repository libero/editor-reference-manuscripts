MANUSCRIPTS := ${addsuffix .dar, ${shell find ./manuscripts/* -maxdepth 1 -type d -exec basename {} \;}}

.PHONY: all \
        clean

.DEFAULT_GOAL := all

all: ${MANUSCRIPTS}

clean:
	@rm -f ${CURDIR}/*.dar

%.dar: ${shell find ./manuscripts/${@:.dar=}/*}
	@echo "Packaging $@"
	@cd ${CURDIR}/manuscripts/${@:.dar=} && zip ../../$@ ./*