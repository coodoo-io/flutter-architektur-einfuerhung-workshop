FLUTTER := $(shell which flutter)

run:
	$(FLUTTER) run

run-chrome:
	$(FLUTTER) run -d Chrome


format:
	$(FLUTTER) format . --line-length 120 --set-exit-if-changed

format-fix:
	$(FLUTTER) format . --line-length 120

clean:
	$(FLUTTER) clean
	$(FLUTTER) pub get

lint:
	$(FLUTTER) analyze