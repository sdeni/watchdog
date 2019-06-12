
build:
	docker build --tag=watchdog .

OS = $(shell uname -o)
ifeq ($(OS),Cygwin)
	PWD = $(shell pwd | xargs cygpath -m)
else
	PWD = $(shell pwd)
endif

run:
	docker run -v $(PWD)/project:/root/watchdog --name watchdog -it --rm watchdog
