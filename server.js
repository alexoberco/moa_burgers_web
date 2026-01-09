import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files from the 'dist' directory
app.use(express.static(path.join(__dirname, 'dist')));

// Handle 404s by serving the index page (optional, for SPA behavior, though Astro is MPA by default)
// For a simple landing page, this ensures all routes go to index if they don't match a file
app.use((req, res) => {
    res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Moa Burgers server running on 0.0.0.0:${PORT}`);
});

