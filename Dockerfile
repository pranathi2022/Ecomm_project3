FROM nginx:alpine

# Remove default nginx config
RUN rm -f /etc/nginx/conf.d/default.conf

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy React build files
COPY build/ /usr/share/nginx/html/

# Expose nginx port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
