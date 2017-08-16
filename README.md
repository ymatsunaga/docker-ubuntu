Ubuntu image for GENESIS development

# Usage

Running interactive shell:

```bash
docker run -it --rm -v $(pwd):/work ymatsunaga/ubuntu bash
```

Comipling genesis:

```bash
docker run --rm -v ~/genesis:/work -w /work/src ymatsunaga/ubuntu ./configure
docker run --rm -v ~/genesis:/work -w /work/src ymatsunaga/ubuntu make install
```

Testing genesis:

```bash
cd ~/tests/regression_test/
docker run --rm -v ~/genesis/bin/spdyn:/spdyn -v $(pwd):/work ymatsunaga/ubuntu python ./test.py "mpirun -np 8 /spdyn"
```

Running genesis:

```bash
docker run --rm -v ~/genesis/bin/spdyn:/spdyn -v $(pwd):/work ymatsunaga/ubuntu mpirun -np 8 /spdyn run.inp
```

