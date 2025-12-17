meson setup builddir
rm -rf debug
meson configure builddir -Dprefix="$(pwd)/debug"
cd builddir
meson compile -v && meson install

# Package build
# meson dist -C builddir/ --no-tests