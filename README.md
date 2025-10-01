Build Image:
```shell
docker build -t nokact:0.0.1 -f Dockerfile.act .
```

Usage:
```shell
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v <folder_with_.github_folder_and_workflows>:/app -it nokact:0.0.1 <your_act_command>
```

Example 1:
```shell
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD"/github-actions-demo:/app -it nokact:0.0.1 act -l
```
Output:
<img width="1235" height="80" alt="image" src="https://github.com/user-attachments/assets/7bc851c9-5061-4636-84d8-1f062b2936a3" />


Example 2:
```shell
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD"/github-actions-demo:/app -it nokact:0.0.1 act -j test
```
Output:
```
INFO[0000] Using docker host 'unix:///var/run/docker.sock', and daemon socket 'unix:///var/run/docker.sock'
? Please choose the default image you want to use with act:
  - Large size image: ca. 17GB download + 53.1GB storage, you will need 75GB of free disk space, snapshots of GitHub Hosted Runners without snap and pulled docker images
  - Medium size image: ~500MB, includes only necessary tools to bootstrap actions and aims to be compatible with most actions
  - Micro size image: <200MB, contains only NodeJS required to bootstrap actions, doesn't work with all actions

Default image and other options can be changed manually in /root/.config/act/actrc (please refer to https://nektosact.com/usage/index.html?highlight=configur#configuration-file for additional information about file structure) Medium
[CI/test] ⭐ Run Set up job
[CI/test] 🚀  Start image=catthehacker/ubuntu:act-latest
[CI/test]   🐳  docker pull image=catthehacker/ubuntu:act-latest platform= username= forcePull=true
[CI/test]   🐳  docker create image=catthehacker/ubuntu:act-latest platform= entrypoint=["tail" "-f" "/dev/null"] cmd=[] network="host"
[CI/test]   🐳  docker run image=catthehacker/ubuntu:act-latest platform= entrypoint=["tail" "-f" "/dev/null"] cmd=[] network="host"
[CI/test]   🐳  docker exec cmd=[node --no-warnings -e console.log(process.execPath)] user= workdir=
[CI/test]   ✅  Success - Set up job
[CI/test]   ☁  git clone 'https://github.com/actions/setup-node' # ref=v1
[CI/test] ⭐ Run Main actions/checkout@v2
[CI/test]   🐳  docker cp src=/app/. dst=/app
[CI/test]   ✅  Success - Main actions/checkout@v2 [111.361039ms]
[CI/test] ⭐ Run Main actions/setup-node@v1
[CI/test]   🐳  docker cp src=/root/.cache/act/actions-setup-node@v1/ dst=/var/run/act/actions/actions-setup-node@v1/
[CI/test]   🐳  docker exec cmd=[/opt/acttoolcache/node/18.20.8/x64/bin/node /var/run/act/actions/actions-setup-node@v1/dist/index.js] user= workdir=
| [command]/opt/hostedtoolcache/node/10.24.1/x64/bin/node --version
| v10.24.1
| [command]/opt/hostedtoolcache/node/10.24.1/x64/bin/npm --version
| 6.14.12
[CI/test]   ❓ add-matcher /run/act/actions/actions-setup-node@v1/.github/tsc.json
[CI/test]   ❓ add-matcher /run/act/actions/actions-setup-node@v1/.github/eslint-stylish.json
[CI/test]   ❓ add-matcher /run/act/actions/actions-setup-node@v1/.github/eslint-compact.json
[CI/test]   ✅  Success - Main actions/setup-node@v1 [1.044127188s]
[CI/test]   ⚙  ::add-path:: /opt/hostedtoolcache/node/10.24.1/x64/bin
[CI/test] ⭐ Run Main echo "running from inside my pipeline locally"
[CI/test]   🐳  docker exec cmd=[bash -e /var/run/act/workflow/2] user= workdir=
| running from inside my pipeline locally
[CI/test]   ✅  Success - Main echo "running from inside my pipeline locally" [170.987245ms]
[CI/test] ⭐ Run Main npm install
[CI/test]   🐳  docker exec cmd=[bash -e /var/run/act/workflow/3] user= workdir=
| added 280 packages from 643 contributors and audited 280 packages in 4.535s
|
| 24 packages are looking for funding
|   run `npm fund` for details
|
| found 49 vulnerabilities (11 low, 13 moderate, 21 high, 4 critical)
|   run `npm audit fix` to fix them, or `npm audit` for details
[CI/test]   ✅  Success - Main npm install [5.261219412s]
[CI/test] ⭐ Run Main npm test
[CI/test]   🐳  docker exec cmd=[bash -e /var/run/act/workflow/4] user= workdir=
|
| > github-actions-demo@1.0.0 test /app
| > mocha ./tests --recursive
|
|
|
|   GET /
|     ✓ should respond with hello world
|
|
|   1 passing (17ms)
|
[CI/test]   ✅  Success - Main npm test [519.740039ms]
[CI/test] ⭐ Run Complete job
[CI/test] Cleaning up container for job test
[CI/test]   ✅  Success - Complete job
[CI/test] 🏁  Job succeeded
```
