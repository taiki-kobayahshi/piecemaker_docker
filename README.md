# piecemaker_docker

## Get Started
```bash
# Clone the repository:
git clone https://github.com/taiki-kobayahshi/piecemaker_docker.git
cd piecemaker_docker
docker-compose up
```

If you want to enter inside the container, run the following command.
```bash
docker exec -it piecemaker_dokcer_piecemaker_1 bash
```

By executing the following command, files and directories in the container can be copied to the host side.
```bash
docker cp piecemaker_dokcer_piecemaker_1:{container_source_path} /{host_target_path}
```
