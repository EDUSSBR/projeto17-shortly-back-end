FROM node:alpine

WORKDIR /home/ubuntu/shortly

COPY . /home/ubuntu/shortly/

RUN npm ci

EXPOSE 5000

CMD ["npm", "start"]