import type { Config } from 'tailwindcss';

const config: Config = {
  content: [
    './app/**/*.{ts,tsx}',
    './components/**/*.{ts,tsx}',
    './lib/**/*.{ts,tsx}'
  ],
  theme: {
    extend: {
      colors: {
        nen: '#F8FAFC',
        chinh: '#1D4ED8'
      }
    }
  },
  plugins: []
};

export default config;
