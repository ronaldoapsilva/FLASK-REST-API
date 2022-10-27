docker_build:
	docker build -t rest-apis-flask-python .

docker_run:
	docker run -p 5005:5000 --name rest-apis faaf6434

docker_run_backgroun:
	docker run -d -p 5005:5000 faaf6434

docker_rm:
	docker stop rest-apis
	docker rm rest-apis
