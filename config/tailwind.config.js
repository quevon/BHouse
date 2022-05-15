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
      fontFamily: {
        sans: ['Poppins'],
        heading: ['Alegreya Sans'],
      },
      colors: {
        'misty-rose': '#fbe9df',
        tomato: {
          DEFAULT: '#FE6140',
          50: '#FFF8F7',
          100: '#FFE7E2',
          200: '#FFC6BA',
          300: '#FEA491',
          400: '#FF8268',
          500: '#FE6140',
          600: '#E14525',
          700: '#B1371D',
          800: '#822713',
          900: '#52180B',
        },
      },
      backgroundImage: {
        'hero-image':
          "url('https://res.cloudinary.com/dbegssigw/image/upload/v1651573596/bhouse/background_n5oq6b.jpg')",
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
}
