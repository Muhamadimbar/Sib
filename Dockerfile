FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    sqlite3 \
    libsqlite3-dev \
    libzip-dev \
    libxml2-dev \
    && docker-php-ext-install pdo pdo_sqlite zip xml \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Setup environment
RUN cp .env.example .env \
    && php artisan key:generate --force \
    && mkdir -p database \
    && touch database/database.sqlite \
    && php artisan migrate --force --seed \
    && php artisan storage:link --force \
    && php artisan config:cache \
    && php artisan route:cache \
    && php artisan view:cache

# Set permissions
RUN chmod -R 775 storage bootstrap/cache

EXPOSE 8080

CMD php artisan serve --host=0.0.0.0 --port=${PORT:-8080}
