tag: terminal
-
docker peace: "docker ps\n"
docker shell <user.text>:
    insert("docker exec -it {text} sh\n")
