FROM cirrusci/flutter:1.26.0-1.0.pre

WORKDIR /app

COPY . .

# Install dependencies
RUN chown -R cirrus:cirrus .
USER cirrus
RUN flutter pub get

# Build the app
RUN flutter build apk --release

# Start the app
CMD ["flutter", "run"]
