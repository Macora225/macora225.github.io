# 1. Sabse pehle Puppeteer ka official image use karein (Chrome included)
FROM ghcr.io/puppeteer/puppeteer:latest

# 2. Permissions ke liye root user switch karein
USER root

# 3. App folder banayein
WORKDIR /app

# 4. Sirf package files copy karein taaki cache use ho sake
COPY package*.json ./

# 5. Saari dependencies install karein
RUN npm install

# 6. Baaki saara code copy karein
COPY . .

# 7. Hugging Face ka mandatory port set karein
ENV PORT=7860
EXPOSE 7860

# 8. App ko start karein
CMD ["node", "index.js"]

