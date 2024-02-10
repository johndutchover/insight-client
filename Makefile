update-deps:
	.venv/bin/python -m pip install --upgrade pip-tools pip wheel
	.venv/bin/python -m piptools compile --upgrade --resolver backtracking -o requirements/requirements.txt pyproject.toml
	.venv/bin/python -m piptools compile --extra dev --upgrade --resolver backtracking -o requirements/requirements-dev.txt pyproject.toml


init:
	rm -rf .tox
	.venv/bin/python -m pip install --upgrade pip wheel
	.venv/bin/python -m pip install --upgrade -r requirements/requirements.txt -r requirements/requirements-dev.txt -e .
	.venv/bin/python -m pip check

update: update-deps init

.PHONY: update-deps init update all clean test
