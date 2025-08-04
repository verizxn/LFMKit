all:
	swift build

build:
	swift build

docs:
	sourcedocs generate --spm-module LFMKit --output-folder docs