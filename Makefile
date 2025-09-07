.PHONY : all help build preview clean

HUGO := hugo
BUILD_OUTPUT := public

all: help

help:
	@echo "Usage:"
	@echo "  make build     - Build the site"
	@echo "  make preview   - Preview the site locally"
	@echo "  make clean     - Clean the build output"

build:
	@$(HUGO) --minify

preview:
	@$(HUGO) server -D

clean:
	@rm -rf $(BUILD_OUTPUT)
	@rm -f .hugo_build.lock
