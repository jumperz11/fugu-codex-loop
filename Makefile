.PHONY: help init doctor doctor-example

help:
	@echo "Fugu + Codex Loop"
	@echo ""
	@echo "  make init            Set up docs/ memory in the current repo"
	@echo "  make doctor          Check if repo memory is ready for a build block"
	@echo "  make doctor-example  Validate the bundled example run"

init:
	python3 scripts/init.py .

doctor:
	python3 scripts/doctor.py .

doctor-example:
	python3 scripts/doctor.py examples/demo-run/repo
