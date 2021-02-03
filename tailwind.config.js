module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'space-cadet': 'var(--color-space-cadet)',
        'manatee': 'var(--color-manatee)',
        'alice-blue': 'var(--color-alice-blue)',
        'imperial-red': 'var(--color-imperial-red)',
        'amaranth-red': 'var(--color-amaranth-red)',
      },
      fontFamily: {
        body: ['Montserrat', 'sans-serif'],
      }
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
