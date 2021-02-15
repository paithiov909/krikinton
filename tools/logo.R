img <- file.path(
  getwd(),
  "man",
  "figures",
  "chestnut.png"
)

hexSticker::sticker(
  img,
  s_x = 1,
  s_width = .5,
  s_height = .5,
  p_size = 20,
  package = "krikinton",
  p_color = "#34f386",
  h_size = 2.6,
  h_fill = "#f334a1",
  h_color = "#f3e634",
  filename = "man/figures/logo-origin.png"
)

usethis::use_logo("man/figures/logo-origin.png")
pkgdown::build_favicons(overwrite = TRUE)
