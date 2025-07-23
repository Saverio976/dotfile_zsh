TARGET		=	myzsh

build:
	podman build -t "$(TARGET)" .

run:
	podman run --rm -it "$(TARGET)"
