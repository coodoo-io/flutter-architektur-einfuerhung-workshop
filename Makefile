FLUTTER := $(shell which flutter)

run:
	$(FLUTTER) run

format:
	$(FLUTTER) format . --line-length 120 --set-exit-if-changed

format-fix:
	$(FLUTTER) format . --line-length 120

clean:
	$(FLUTTER) clean
	$(FLUTTER) pub get

lint:
	$(FLUTTER) analyze

build-runner:
	$(FLUTTER) pub run build_runner build --delete-conflicting-outputs
