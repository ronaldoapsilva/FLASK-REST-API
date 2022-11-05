docker_build:
	docker build -t rest-apis-flask-python .

docker_run:
	docker run -p 5005:5000 --name rest-apis faaf6434

docker_run_bg:
	docker run -dp 5005:5000 rest-apis-flask-python

docker_run_with_vol:
	docker run --name rest-apis -dp 5005:5000 -v "c:/Users/111942631/Documents/GitHubPersonal/FLASK-REST-API":/app rest-apis-flask-python

docker_rm:
	docker stop rest-apis
	docker rm rest-apis
