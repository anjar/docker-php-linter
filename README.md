#Dockerized PHP Code checker tools


Currently there are 2 library that can be use:
* [ECS](https://github.com/symplify/easy-coding-standard)
* [PHPMD](https://phpmd.org/)


---
#### How to use

* Create ecs.php, if you wanna use ECS, see ecs.php.example, or read [ECS Documentation](https://github.com/symplify/easy-coding-standard).
* Create ruleset.xmlif you want use PHPMD

* Ecs example:
  ```bash
    cd /path/to/app
    docker run --rm -v $(pwd):/app befrajna/php-code-checker ecs check /app/ 
  ```

* PHPMD example:
  ```bash
    cd /path/to/app
    docker run --rm -v $(pwd):/app befrajna/php-code-checker phpmd /app/ ansi ruleset.xml --exclude vendor/,node_modules/
  ```
