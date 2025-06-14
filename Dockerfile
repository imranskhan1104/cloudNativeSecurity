FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl
COPY ./app /app
WORKDIR /app
CMD ["/app/run_script.sh"]
