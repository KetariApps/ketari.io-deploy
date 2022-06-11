certbot-test:
	@chmod +x ./webserver/register_ssl.sh
	@sudo ./webserver/register_ssl.sh \
								--domains "$(DOMAINS)" \
								--email $(EMAIL) \
								--data-path ./webserver/certbot \
								--staging 1

certbot-prod:
	@chmod +x ./webserver/register_ssl.sh
	@sudo ./webserver/register_ssl.sh \
								--domains "$(DOMAINS)" \
								--email $(EMAIL) \
								--data-path ./webserver/certbot \
								--staging 0

deploy-prod:
	@docker-compose -f $(FILE) down -v 
	@docker-compose -f $(FILE) up --always-recreate-deps -d --build --force-recreate -e CONTEXT=$(CTX) -e SERVER_NAME=$(SVR)
