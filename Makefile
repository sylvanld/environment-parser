
.PHONY: dist

help: ## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

dist: ## Build package and upload artifacts to PyPI (twine required)
	python setup.py sdist bdist_wheel
	#pipenv run twine upload dist/*
	rm -rf build/ *.egg-info/ dist/