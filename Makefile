docker_build:
	docker build -t rest-apis-flask-python .

docker_run:
	docker run -p 5000:80 --name rest-apis 1cb0a3df82f1955fb184fa9d3711452b745c987ee7615626e343be228ba95fc3

docker_run_sh:
	docker run -p 5000:5000 -w /app -v "%cd%:/app" rest-apis-flask-python sh -c "flask run --host 0.0.0.0"

docker_run_bg:
	docker run -dp 5005:5000 rest-apis-flask-python



docker_run_with_vol:
	docker run --name rest-apis -dp 5005:5000 -v "c:/Users/111942631/Documents/GitHubPersonal/FLASK-REST-API":/app rest-apis-flask-python

docker_rm:
	docker stop rest-apis
	docker rm rest-apis
