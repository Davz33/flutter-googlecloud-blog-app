# Use the Dart SDK base image
FROM dart:stable AS build

WORKDIR /app

# Copy only the server dependencies
COPY pubspec.yaml pubspec.lock ./
RUN dart pub get

# Copy server code and static web output
COPY server.dart ./
COPY public ./public

# Use a smaller runtime image for serving
FROM dart:stable AS runtime
WORKDIR /app

# Copy only pubspec files and get dependencies in runtime image
COPY pubspec.yaml pubspec.lock ./
RUN dart pub get

# Copy server code and static web output
COPY server.dart ./
COPY public ./public

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Start the Dart server
CMD ["dart", "run", "server.dart"] 