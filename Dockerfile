FROM python:3.10-bullseye

WORKDIR /workspace
COPY requirements.txt requirements.txt
RUN apt-get update && apt-get install -y git ffmpeg && pip3 install -r requirements.txt && rm -rf /var/lib/apt/lists/* && useradd -m -u 1001 waas
USER waas

COPY src src
COPY worker-settings.py /workspace/

CMD [ "flask", "--app" , "src/main", "--debug", "run","--host", "0.0.0.0","--port", "3000"]
