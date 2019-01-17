# scripts-docker-volume
Repo containing scripts with Dockerfile for preparing a Docker image Volume

Start the container as `my_scripts`, based on the image, which will have a directory `/scripts/` (mounted as `VOLUME`).
```bash
docker run --name my_scripts chrishah/scripts-docker-volume
```

Now, run any container with software, accessing a script from the volume. As an example we'll run the script `hello.sh` using three different docker containers. The script just does a couple of `echo`'s and then executes a program called `kmc` without any options, which will display the usage info for the program. 
The first image `chrishah/kmc3-docker` has `kmc` version 3 installed. The second image `chrishah/mitobim` does not have `kmc` installed, so this will give an error. The third image `chrishah/bless` has `kmc` version 2 installed.

```bash
docker run --rm --volumes-from my_scripts chrishah/kmc3-docker /scripts/hello.sh
docker run --rm --volumes-from my_scripts chrishah/mitobim /scripts/hello.sh
docker run --rm --volumes-from my_scripts chrishah/bless /scripts/hello.sh
```

Now, let's see if we can actually process data that is present on our local machine (in `./testdata/`) using a script from the Volume (`my_scripts`), that runs a program installed in an image (`chrishah/bless`).
```bash
docker run --rm --volumes-from my_scripts -v $(pwd):/in/ -w /in/ chrishah/bless \
	/scripts/bless_iterate_over_ks.sh testdata/test.1.fastq.gz test 21
```

Once you're done, you can remove the volume container:
```bash
docker rm my_scripts
```
