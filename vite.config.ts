import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [react(), tailwindcss()],
  clearScreen: false,
  server: {
    port: 1420,
    strictPort: true,
  },
  envPrefix: ['VITE_', 'TAURI_'],
  // Pre-bundle CJS Vapi/Daily so Vite's default interop is consistent in dev.
  optimizeDeps: {
    include: ['@vapi-ai/web', '@daily-co/daily-js', 'events'],
  },
})
