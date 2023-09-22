FROM node:14
RUN apt-get update -y && apt-get upgrade -y

# Based on requirements from pa11y-dashboard,
# the dependencies listed here https://pptr.dev/troubleshooting#chrome-doesnt-launch-on-linux
# the official Dockerfile for puppeteer https://github.com/puppeteer/puppeteer/blob/main/docker/Dockerfile


RUN apt-get install -y libnss3 libgconf-2-4 \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    lsb-release \
    wget \
    xdg-utils

RUN groupadd -r pptruser && useradd -rm -g pptruser -G audio,video pptruser

USER pptruser

WORKDIR /home/pptruser
COPY pa11y-dashboard/ .



RUN npm install

CMD ["npm", "start"]
