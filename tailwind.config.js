const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './app/views/**/*.{html,html.erb,erb}',
    './app/components/**/*.{rb,erb,html}',
    './app/javascript/**/*.{vue,js,ts,jsx,tsx,css}',
    './config/initializers/*.{rb}',
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Plus Jakarta Sans', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [],
}
