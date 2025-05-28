# 🚀 Flutter Google Cloud Blog App

Welcome to the **Flutter Google Cloud Blog App** monorepo! This project is a modern, scalable, and cloud-ready blog platform featuring:

- 🦄 **Flutter Web Frontend** (`apps/frontend`)
- 🦾 **Dart Backend Server** (`apps/backend`)
- ☁️ **Google Cloud Run**-ready deployment
- 🐳 **Docker** support for local and cloud environments

---

## 📦 Monorepo Structure

```
apps/
  frontend/   # Flutter web app (UI)
  backend/    # Dart server (API + static serving)
README.md     # You are here!
copy_web_build.sh # Build & copy script
```

---

## 🖥️ Frontend: Flutter Web
- All your UI code lives in `apps/frontend`.
- Build with: `flutter build web`
- Output is copied to the backend for serving.

## 🛠️ Backend: Dart Server
- Located in `apps/backend`.
- Uses [`shelf`](https://pub.dev/packages/shelf) to serve static files and API endpoints.
- Serves the built web app from the `/static` directory.
- Ready for Google Cloud Run or local Docker.

---

## 🚢 Deployment

### 1. **Build the Web App**
```bash
./copy_web_build.sh
```

### 2. **Run Locally with Docker**
```bash
cd apps/backend
# Build and run
docker build -t blog-backend .
docker run -p 8080:8080 blog-backend
```

### 3. **Deploy to Google Cloud Run**
- Make sure you have the [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed and authenticated.
- From `apps/backend`:
```bash
gcloud run deploy --source .
```

---

## 📝 Development Workflow

- Use feature branches for new work.
- Keep `main` always deployable.
- PRs are welcome! 🚀

---

## 🧩 Tech Stack
- Flutter (Web)
- Dart (Backend)
- Shelf (Server)
- Docker
- Google Cloud Run

---

## 🦉 Tips & Conventions
- Static web assets are served from `static/` in the backend (industry best practice).
- Use `.gitignore` to keep your repo clean (see included file).
- Use `copy_web_build.sh` to sync frontend build to backend.

---

## 🤝 Contributing

1. Fork this repo 🍴
2. Create your feature branch (`git checkout -b feat/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feat/amazing-feature`)
5. Open a Pull Request 🚀

---

## 📄 License

MIT © 2025

---

> Made with ❤️ by the community. Happy coding! 