# Codingame Summer Challenge 2024 - Olymbits

This is a fork of the original referee, adding the ability to run it through commandline.

## Usage

### With Docker
If you use docker, the Dockerfile will do all the work for you, you can just:
- Build the image:
  ```bash
  docker build -t cg-summer-2024-referee .
  ```
- Use it. For example, if placed in my compiled bot (named `bot`) current directory, I can run:
  ```bash
  # command line mode
  docker run --rm -v .:/bots cg-summer-2024-referee -p1 /bots/bot -p2 /bots/bot -p3 /bots/bot
  # Interactive mode, open http://localhost:8888/
  docker run --rm -p 8888:8888 -v .:/bots cg-summer-2024-referee -p1 /bots/bot -p2 /bots/bot -p3 /bots/bot -s
  ```

### Build and use the jar
Building the JAR with a functional viewer has some requirements:
- JDK 17
- Maven
- a recent Node version (successfully tested with Node v20.14)

Steps:
- First build the viewer:
  ```bash
  cd src/main/resources
  npm install
  npm run build
  ```
- Then build the Jar:
  ```bash
  mvn package
  ```

You can then run the built Jar (located in `target/spring-2024-olympics-1.0-SNAPSHOT.jar`) with the command `java -jar spring-2024-olympics-1.0-SNAPSHOT.jar`.