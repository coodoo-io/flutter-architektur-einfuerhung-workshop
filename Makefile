FLUTTER := $(shell which flutter)
FLUTTER_BIN_DIR := $(shell dirname $(FLUTTER))
DART := $(FLUTTER_BIN_DIR)/cache/dart-sdk/bin/dart

default: clean format-fix lint test start

start:
	$(FLUTTER) run

start-release:
	$(FLUTTER) run --release

format:
	$(FLUTTER) format . --line-length 120 --set-exit-if-changed

format-fix:
	$(FLUTTER) format . --line-length 120

lint:
	$(FLUTTER) analyze

test:
	$(FLUTTER) test
.PHONY: test

packages-outdated:
	$(FLUTTER) pub outdated

packages-upgrade:
	$(FLUTTER) pub upgrade

clean:
	$(FLUTTER) clean
	$(FLUTTER) pub get

clean-hard:
	rm -rf pubspec.lock
	rm -rf ios/Podfile.lock
	rm -rf ios/.symlinks
	rm -rf ios/Pods
	rm -rf ios/Runner.xcworkspace
	# $(FLUTTER) pub cache repair
	make clean
	$(FLUTTER) pub upgrade