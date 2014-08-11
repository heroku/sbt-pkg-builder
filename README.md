This project is used to build various tarballs of pre-seeded SBT and Ivy dependency
caches (so you don't have to download the Internet everytime you build a new app).

To build all the tarballs, run this:

```
./docker-build.sh
```

This will create some very big files in root directory of the project.

You can also build each tarball outside of Docker, but be care on OS X 
because you'll get some `.DS_Store` all up in your tarball.

```
./bin/build-play.sh
```

These tarballs are then upload to `heroku-jvm-langpack-scala.s3.amazonaws.com`
where they are used by the heroku-buildpack-scala.
