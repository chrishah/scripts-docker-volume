# scripts-docker-volume
Repo containing scripts with Dockerfile for preparing a Docker image Volume

Start the container as `my_scripts`, which will have a directory `/scripts/`, which was mounted as `VOLUME`, that contains the scripts.
```bash
docker run --name my_scripts chrishah/scripts
```

Now run any container with software, accessing a script from the volume:
```bash
docker run --rm --volumes-from my_scripts chrishah/kmc3-docker /scripts/hello.sh
docker run --rm --volumes-from my_scripts chrishah/mitobim /scripts/hello.sh
docker run --rm --volumes-from my_scripts -v $(pwd):/in/ -w /in/ chrishah/bless /scripts/hello.sh
docker run --rm --volumes-from my_scripts -v $(pwd):/in/ -w /in/ chrishah/bless /scripts/bless_iterate_over_ks.sh testdata/test.1.fastq.gz test 21
```

Once you're done, you can remove the volume container:
```bash
docker rm my_scripts
```
