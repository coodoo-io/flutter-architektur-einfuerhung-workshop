FLUTTER := $(shell which flutter)

format:
   $(FLUTTER) format . --line-length 120 --set-exit-if-changed

format-fix:
   $(FLUTTER) format . --line-length 120

lint:
   $(FLUTTER) analyze
