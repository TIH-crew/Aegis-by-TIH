import { defineConfig } from 'vitest/config'
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
  optimizeDeps: {
    include: ['@vapi-ai/web', '@daily-co/daily-js', 'events', 'decimal.js'],
  },
  test: {
    environment: 'node',
    include: ['src/**/*.test.ts'],
  },
})
