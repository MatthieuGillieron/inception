all:
	@mkdir -p /home/magillie/data/db
	@mkdir -p /home/magillie/data/wordpress
	@docker compose -f srcs/docker-compose.yml up -d --build

down:
	@docker compose -f srcs/docker-compose.yml down

re: down all

clean:
	@docker compose -f srcs/docker-compose.yml down -v
	@docker system prune -af

fclean: clean
	@rm -rf /home/magillie/data/db
	@rm -rf /home/magillie/data/wordpress

.PHONY: all down re clean fclean
