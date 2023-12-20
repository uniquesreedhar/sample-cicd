# Use the official Nginx image
FROM nginx:alpine

# Remove the default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file to the default Nginx HTML directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 for Nginx
EXPOSE 80

