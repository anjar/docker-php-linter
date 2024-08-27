# Dockerized PHP Code checker tools


Currently there are 2 library that can be use:
* [ECS](https://github.com/symplify/easy-coding-standard)
* [PHPMD](https://phpmd.org/)


---
#### How to use

* Authenticate with github container.
 ```bash
  export CR_PAT=YOUR_TOKEN_WITH_READ_ACCESS_TO_PACKAGES
  echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
 ```
 
* Create ecs.php, if you wanna use ECS, see ecs.php.example.
* Create ruleset.xml, if you want use PHPMD.
* Ecs example:
  ```bash
    cd /path/to/app
    docker run --rm -v $(pwd):/app ghcr.io/anjar/docker-php-linter ecs check /app/ 
  ```

* PHPMD example:
  ```bash
    cd /path/to/app
    docker run --rm -v $(pwd):/app ghcr.io/anjar/docker-php-linter phpmd /app/ ansi ruleset.xml --exclude vendor/,node_modules/
  ```
