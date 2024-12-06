const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './app/views/**/*.{html,html.erb,erb}',
    './app/javascript/**/*.{vue,js,ts,jsx,tsx}',
    './config/initializers/*.{rb}',
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Roboto', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [],
}
