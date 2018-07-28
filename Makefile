BUILD=build
DC=docker-compose
DOWN=down
UP=up -d
RM=rm -rf
NAME_ERROR_MSG="Error service must be precise(eg. make exec service=<CONTAINER_NAME>)"
service=

all: .user.config.yml down_build_up

down_build_up: down build up

buid_up: build up

build:
	$(DC) $(BUILD)

up:
	$(DC) $(UP)

down:
	$(DC) $(DOWN)

clean:
	$(DC) $(DOWN) --volumes

ps:
	$(DC) ps

logs:
	$(DC) logs -f

.user.config.yml:
		@echo 'version: "2"'            > $@
		@echo 'services:'               >> $@
		@echo '  user_services:'        >> $@
		@echo '    build:'              >> $@
		@echo '      context: src/'     >> $@
		@echo '      args:'			        >> $@
		@echo '        UID: '$(shell id -u)   >> $@
		@echo '    user: "'$(shell id -u)'"'  >> $@
