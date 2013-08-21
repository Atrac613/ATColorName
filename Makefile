PROJECT = ATColorNames.xcodeproj
SCHEME = ATColorNames

clean:
	xctool \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		clean

test:
	xctool \
                -project $(PROJECT) \
                -scheme $(SCHEME) \
		-sdk iphonesimulator \
		VALID_ARCHS=i386 \
		build \
		test 
