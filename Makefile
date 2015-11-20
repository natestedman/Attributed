XCODE_COMMAND=$(shell { command -v xctool || command -v xcodebuild; } 2>/dev/null)
XCODE_GENERIC_FLAGS=-project 'Attributed.xcodeproj'
XCODE_OSX_FLAGS=-scheme 'Attributed-OSX'
XCODE_IOS_FLAGS=-scheme 'Attributed-iOS'

.PHONY: all clean docs test

all:
	$(XCODE_COMMAND) $(XCODE_GENERIC_FLAGS) $(XCODE_OSX_FLAGS) build
	$(XCODE_COMMAND) $(XCODE_GENERIC_FLAGS) $(XCODE_IOS_FLAGS) build

clean:
	$(XCODE_COMMAND) $(XCODE_GENERIC_FLAGS) $(XCODE_OSX_FLAGS) clean
	$(XCODE_COMMAND) $(XCODE_GENERIC_FLAGS) $(XCODE_IOS_FLAGS) clean

docs:
	jazzy \
		--clean \
		--author "Nate Stedman" \
		--author_url "http://natestedman.com" \
		--github_url "https://github.com/natestedman/Attributed" \
		--github-file-prefix "https://github.com/natestedman/Attributed/tree/master" \
		--module-version "0.1.0" \
		--xcodebuild-arguments -scheme,Attributed-OSX \
		--module Attributed \
		--output Documentation \

test:
	xcodebuild $(XCODE_GENERIC_FLAGS) $(XCODE_OSX_FLAGS) test
