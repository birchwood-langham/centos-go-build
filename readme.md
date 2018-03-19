# CentOS Go Application build and packaging environment

This is an environment for building Go applications and packaging them into RPM packages for deployment.

## Usage:

To use this image run the following docker command:

docker run -it --rm birchwoodlangham/centos-go-build:latest

You will be logged into the container, from here you can:

```bash
cd $GOPATH/src/birchwoodlangham.com
git clone https://oauth2:API_TOKEN@<your remote git host>/<your git project path>.git
cd <your git project path>
```

To manually fetch dependencies and build your go applications:

```bash
go get ./...
go build -o /path/to/output/file
```

To create an rpm, place the appropriate files in the expected rpmbuild directories.

Create your rpm spec file and place it in the rpmbuild/SPECS folder, then run the rpmbuild command:

```bash
rpmbuild -ba --define "_topdir $PWD/rpmbuild" ./rpmbuild/SPECS/your-specs.file.spec
```

This should build your RPM and place it in rpmbuild/RPMS

To copy the RPM file after you built it, from another terminal, on your host use the docker cp command:

```bash
docker cp <CONTAINER_NAME>:/root/go/src/birchwoodlangham.com/your-project-name/rpmbuild/RPMS/<your-architecture>/your-rpm-file.rpm /path/on/host
```

Alternatively, when you start the container, you can mount the rpmbuild folder of the container to a location on your host:

```bash
docker run -it --rm -v /path/on/host:/root/rpmbuild birchwoodlangham/centos-go-build
```

You will have to recreate the the rpmbuild tree structure if it doesn't exist in the host folder you have mounted to /root/rpmbuild. From inside the container:

```bash
rpmdev-setuptree
```

This will build the appropriate rpmbuild tree for you, and when your RPM has been built, you will be able to find it under the location you have mapped to the container's rpmbuild root folder.



## Change Log

2018-03-19: Initial release
