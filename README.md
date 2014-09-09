This project is used to build various tarballs of pre-seeded SBT and Ivy dependency
caches (so you don't have to download the Internet everytime you build a new app).

To build all the tarballs, run this:

```
./docker-build.sh
```

This will create some very big files in the root directory of the project.

You can also build each tarball outside of Docker, but be careful on OS X
because you'll get some `.DS_Store` all up in your tarball.

```
./bin/build-all.sh
```

These tarballs are then upload to `s3://lang-jvm.s3.amazonaws.com/sbt`
where they are used by the heroku-buildpack-scala.
