PROJECT = ATColorNames.xcodeproj
SCHEME = ATColorNames
UNIVERSAL_SCHEME = ATColorNames-Universal

all:
	xctool \
		-project $(PROJECT) \
		-scheme $(UNIVERSAL_SCHEME) \
		build

clean:
	xctool \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		clean \
		
		xctool \
                	-project $(PROJECT) \
                	-scheme $(UNIVERSAL_SCHEME) \
                	clean

test:
	xctool \
                -project $(PROJECT) \
                -scheme $(SCHEME) \
		-sdk iphonesimulator \
		VALID_ARCHS=i386 \
		build \
		test

test-with-coverage:
        xctool \
                -project $(PROJECT) \
                -scheme $(SCHEME) \
                -sdk iphonesimulator \
                VALID_ARCHS=i386 \
                GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
                GCC_GENERATE_TEST_COVERAGE_FILES=YES \
                build \
                test

send-coverage:
  coveralls \
      -e ATColorNamesTests

