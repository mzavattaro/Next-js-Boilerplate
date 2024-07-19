# Stage 1: Building the app
FROM node:20-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy the rest of your app's source code
COPY . .

# Build your Next.js app
RUN npm run build

# Stage 2: Running the app
FROM node:20-alpine AS runner

# Set the working directory
WORKDIR /app

ENV NODE_ENV production

# Copy the built app and the .next folder from the builder stage
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

# Expose the port your app runs on
EXPOSE 3000

ENV PORT 3000

# Start your app
CMD ["npm", "start"]