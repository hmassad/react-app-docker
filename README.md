# react-docker-app

![](react-app-docker.png)

1. crear app de react

```bash
npx create-react-app react-app-docker
cd react-app-docker
```

2. agregar Dockerfile
3. agregar .dockerignore
4. agregar configuración de nginx
5. generar imagen (build docker image) `docker build -t react-app:1 .`
6. correr un contenedor con la imagen `docker run -it --rm -p 3000:80 react-app:1`
7. acceder a `http://localhost:3000`
