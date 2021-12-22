debug-build:
	xcodebuild \
	-sdk iphoneos \
	-configuration Debug \
	-project GithubRepositorySearch.xcodeproj \
	-scheme GithubRepositorySearch \
	build CODE_SIGNING_ALLOWED=NO

test:
	xcodebuild \
	-sdk iphoneos \
	-configuration Debug \
	-project GithubRepositorySearch.xcodeproj \
	-scheme GithubRepositorySearch \
	-destination 'platform=iOS Simulator,name=iPhone 12 Pro,OS=15.0' \
	clean test CODE_SIGNING_ALLOWED=NO

show-devices:
	xcrun xctrace list devices