import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './', // Looks in all subfolders (api/, utils/)
  timeout: 30000,
  retries: 0,
  reporter: [['html', { outputFolder: '../reports/ui', open: 'never' }]],
  use: {
    baseURL: 'https://jsonplaceholder.typicode.com', // Or your actual API base URL
  },
});
