# === Production build ===
# Используем Node.js для запуска сервера
FROM node:22

WORKDIR /app

# Копируем package.json и устанавливаем только production-зависимости (слой кэшируется)
COPY package*.json ./
RUN npm install --omit=dev

# Копируем исходный код приложения
COPY . .

# Переключаемся на непривилегированного пользователя (безопасность)
USER node

EXPOSE 5000

# Явно указываем режим production
ENV NODE_ENV=production

# Запускаем сервер
CMD ["npm", "start"]