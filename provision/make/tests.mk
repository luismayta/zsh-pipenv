test.help:
	@echo '    Tests:'
	@echo ''
	@echo '        test                      show help'
	@echo '        test.all   	             Run all module test'
	@echo '        test.lint                 Run all pre-commit'
	@echo ''

test: clean
	@echo $(MESSAGE) Running tests on the current Python interpreter with coverage $(END)
	@if [ -z "${run}" ]; then \
		make test.help;\
	fi
	@if [ -n "${run}" ]; then \

test.all: clean
	@echo $(MESSAGE) Running tests on the current Python interpreter with coverage $(END)
	$(DOCKER_COMPOSE_TEST) run --rm $(SERVICE_APP) bash -c \
		"$(PIPENV_RUN) pytest"

test.lint: clean
	$(PIPENV_RUN) pre-commit run --all-files --verbose
