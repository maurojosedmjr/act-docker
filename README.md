Build Image:
```shell
docker build -t nokact:0.0.1 -f Dockerfile.act .
```

Usage:
```shell
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD"/github-actions-demo:/app -it nokact:0.0.1 your_act_command
```

Example 1:
```shell
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD"/github-actions-demo:/app -it nokact:0.0.1 act -l
```

Example 2:
```shell
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD"/github-actions-demo:/app -it nokact:0.0.1 act -j test
```
