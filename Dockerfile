FROM nginx:alpine

COPY index.html /usr/share/ngnix/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]