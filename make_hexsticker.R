library(hexSticker)
library(ggplot2)

# Generate sticker
sticker("man/figures/logo.png",
        package = "rcctvm",
        p_size = 20, p_y = 1.65,
        s_x = 1, s_y = 0.95, s_width = 0.6,   # Adjust position/size inside hex
        h_fill = "#FFFFFF",   # White hex background
        h_color = "darkgrey",  # Red hex border
        p_color = "darkred",  # Red text
        filename = "man/figures/hexsticker.png")
