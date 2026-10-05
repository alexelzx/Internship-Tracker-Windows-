# Stage

Stage is a lightweight internship email tracker for short-stay internship outreach.

## Features

- Gmail-style email previews with search, filters, stars, statuses, follow-ups, and reminders
- Automatic `No reply` status after 14 days without a response
- Dashboard analytics for response rate, status breakdown, and weekly outreach
- Stage due date and personal goal tracking
- World clocks with office-hours guidance and optional weather
- Guides for finding contacts, writing outreach, CV preparation, and ethical research
- Local browser storage with JSON export/import backups
- Responsive desktop and mobile layouts

## Run locally

Open `index.html` directly in a browser. No build tool or server is required.

For a local server, use any static file server, for example:

```powershell
npx serve .
```

Then open the URL shown by the server.

## Windows package

Install dependencies once, then build the desktop packages:

```powershell
npm install
npm run build
```

The build creates `Stage-1.0.0-x64.exe`, a guided installer with desktop and Start menu shortcuts, and `Stage-1.0.0-portable.exe`, which runs without installation. Build output is generated in the system temp directory for Windows file-lock compatibility and copied into `release-final/`.

## Project structure

- `index.html` — application markup and page shell
- `styles.css` — visual design and responsive layout
- `app.js` — application state, rendering, persistence, and interactions
- `dist/` — ready-to-open packaged copy
- `main.js` — Electron desktop wrapper
- `package.json` — Windows packaging scripts and installer configuration
- `release-final/` — generated Windows installer and portable executable

## Data and privacy

Data is stored in the browser's `localStorage`. Use Export backup regularly if the data matters. Weather requests use Open-Meteo when the hosting environment allows external requests; the app reports when weather is unavailable instead of fabricating it.

## License

MIT. See `LICENSE`.
