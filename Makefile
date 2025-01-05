# Default target
.DEFAULT_GOAL := help

# Target pentru afișarea mesajului de utilizare
help:
	@echo ""
	@echo "\033[1mUsage:\033[0m"
	@echo ""
	@echo "  docker compose run --rm docbuilder [command]"
	@echo ""
	@echo "If no [command] is provided, it will show this help."
	@echo "This is also equivalent with running:"
	@echo "docker compose run --rm docbuilder help"
	@echo ""
        @echo ""
