ffmpeg -r 2 -f image2 -i data/snap%d.png -s 1000x1000 -pix_fmt yuv420p -y simulation.mp4
