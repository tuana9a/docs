# how to copy docker image from computer to computer

[https://stackoverflow.com/a/23938978/10459230](https://stackoverflow.com/a/23938978/10459230)

You will need to save the Docker image as a tar file:

```bash
docker save -o path_for_generated_tar_file image_name
```

Then copy your image to a new system with regular file transfer tools such as cp, scp or rsync(preferred for big files). After that you will have to load the image into Docker:

```bash
docker load -i path_to_image_tar_file
```

PS: You may need to sudo all commands.