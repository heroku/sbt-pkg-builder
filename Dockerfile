FROM fabiokung/cedar

WORKDIR /app

ADD projects /app/projects
ADD bin /app/bin

ENTRYPOINT ["./bin/build-all.sh"]
