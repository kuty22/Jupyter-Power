#  Docker and Jupyter, fast datascience environment.

__summary__:

- [Description](#description)
- [Install](#install)
- [Documentation](#documentation)


## Description

__Python3.5 environment for datasciences.__

This platform containe:

service:
- jupyterlab

volumes:
- src/ (persistent)

> ""src/"" volume contains all sources (notebooks, python libraries, etc ...)

- database/(persistent)

> ""database/"" volume contains all datasets (csv, xml, json, etc ...)

## Install

Requirements:
- [Docker](https://www.docker.com)
- [Docker-compose](https://docs.docker.com/compose/)

__Configuration :__

1. docker-compose.yml
```yaml
...
ports:
  - 8881:8888
...
```
In the container Jupyter, it uses the default port(8888, do not change it).
You can change the host port (8881)

2. pip package (src/requirements.txt)
```
`requirements.txt` is a list of pip packages that will be installed on the environment
(need restart and clean to install new packages).
```
3. `datasets/`
  ```shell
  ➜  Jupyter-Power git:(master) : tree -L 2
  .
  ├── Makefile
  ├── README.md
  ├── datasets
  │   ├── dataset.csv
  │   └── examples.csv
  ├── docker-compose.yml
  └── src
      ├── Dockerfile
      ├── conda_env.yml
      ├── example-notebook.ipynb
      └── requirements.txt

  All your datasets can be drag and drop into the datasets folder.
  (it also possible without re-start your container)
  ```

__Run :__

```
make
```

> more informations about Makefile commands in the [documentation section](#documentation)

During the first run, a file `.user.config.yml` is created. This file links the container to its host.
In Jupyter if you modify your sources or create new files those will be saved in the host directory src.

Open your browser and visit the link `localhost:8881`.

## Documentation

_Makefile commands available_:

|   **commands name**   | **description**                    |
|:---------------------:|:---------------------------------- |
|        `make`         | 1. down each service               |
|                       | 2. build basic project             |
|                       | 3. run project                     |
|                       |                                    |
|    `make build_up`    | 1. build basic project             |
|                       | 2. run project                     |
|                       |                                    |
|     `make build`      | build basic project.               |
|                       |                                    |
|       `make up`       | run project                        |
|                       |                                    |
|      `make down`      | down project                       |
|                       |                                    |
|       `make ps`       | list container                     |
|                       |                                    |
|      `make logs`      | display all platform logs          |
|                       |                                    |

## Reference

- [Jupyter](http://jupyter.org)
- [Jupyter Lab](https://github.com/jupyterlab/jupyterlab)
- [Python3.5](https://www.python.org/downloads/release/python-350/)
- [Docker](https://www.docker.com)
- [Docker-compose](https://docs.docker.com/compose/)
