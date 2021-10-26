# invoice-docker

## Build and run
set external dir as workspace in `build` file by replace `<your path>` to your workspace path
```
docker build -t invoice-docker .
docker run --restart=always --name invoice-docker -v <your path>:/invoices invoice-docker
```
