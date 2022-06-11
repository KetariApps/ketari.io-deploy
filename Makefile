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
	@docker-compose down -v 
	@docker-compose up --always-recreate-deps -d --build --force-recreate
