return {
  filetypes = {"c", "cpp", "ino"},

  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--query-driver=/usr/bin/avr-gcc,**/avr-gcc,**/avr-g++",
  },
}
