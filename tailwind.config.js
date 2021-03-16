module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'space-cadet': 'var(--color-space-cadet)',
        'ebony-clay': 'var(--color-ebony-clay)',
        'manatee': 'var(--color-manatee)',
        'alice-blue': 'var(--color-alice-blue)',
        'imperial-red': 'var(--color-imperial-red)',
        'amaranth-red': 'var(--color-amaranth-red)',
        'tall-red': 'var(--color-tall-red)',
      },
      fontFamily: {
        admin: ['Montserrat', 'sans-serif'],
        app: ['Ubuntu', 'sans-serif'],
        spartan: ['League Spartan', 'sans'],
      },
      container: {
        center: true,
        padding: '2rem'
      },
      maxHeight: {
        'screen-half': '50vh',
        'none': 'none',
      }
    }
  },
  variants: {
    extend: {
      backgroundColor: ['checked'],
      borderColor: ['checked'],
    },
  },
  plugins: [],
}
