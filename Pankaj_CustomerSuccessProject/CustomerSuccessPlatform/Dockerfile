FROM node:20-alpine AS builder
WORKDIR /app  
COPY package.json ./

RUN npm install -g @angular/cli
RUN npm install

COPY . .
RUN ng build --configuration production
#-----------------------------
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf 

COPY --from=builder /app/dist/customer-success-platform/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]