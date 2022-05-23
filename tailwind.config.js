module.exports = {
  purge: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        primary: {
          100: "#D3EAF5",
          200: "#66B4DB",
          300: "#2983B1", //基本主色
          400: "#237096",
          500: "#1D5B7A",
          600: "#16465E",
        },
        secondary: {
          100: "#FEF1D7",
          200: "#FBD588",
          300: "#F9C04B", //基本副色
          400: "#8B5E04",
        },
        wrong: "#D883A3",
        safe: "#98C37C",
        draft: "#CAC7AE",
        rice: "#F0EDCE",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};