BUILD=build
DC=docker-compose
DOWN=down
UP=up -d
RM=rm -rf
NAME_ERROR_MSG="Error service must be precise(eg. make exec service=<CONTAINER_NAME>)"
service=

# down build and start
all: down_build_up

### basic make ###
down_build_up: down build up

buid_up: build up

build:
	$(DC) $(BUILD)

up:
	$(DC) $(UP)

down:
	$(DC) $(DOWN)

### utils ###
ps:
	$(DC) ps

logs:
	$(DC) logs -f

exec:
ifndef service
	@echo $(NAME_ERROR_MSG)
	@exit 1
endif
	$(DC) exec $(service) bash
