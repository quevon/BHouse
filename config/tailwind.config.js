const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  darkMode: 'class',
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      colors: {
        tomato: {
          DEFAULT: '#FE6140',
          50: '#FFF8F7',
          100: '#FFE7E2',
          200: '#FFC6BA',
          300: '#FEA491',
          400: '#FE8369',
          500: '#FE6140',
          600: '#FE3308',
          700: '#CD2401',
          800: '#951B01',
          900: '#5D1100',
        },
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
}
