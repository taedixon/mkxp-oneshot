shaders_src = [
    'common.h',
    'bitmapBlit.frag',
    'blur.frag',
    'flashMap.frag',
    'flatColor.frag',
    'gray.frag',
    'hue.frag',
    'obscured.frag',
    'plane.frag',
    'simpleAlpha.frag',
    'simpleAlphaUni.frag',
    'simpleColor.frag',
    'simple.frag',
    'sprite.frag',
    'trans.frag',
    'transSimple.frag',

    'blurH.vert',
    'blurV.vert',
    'minimal.vert',
    'simpleColor.vert',
    'simpleMatrix.vert',
    'simple.vert',
    'sprite.vert',
    'tilemap.vert',
]

embedded_shaders_f = files(shaders_src)

count = 0
foreach file : embedded_shaders_f
    global_sources += custom_target(shaders_src[count],
        input: file,
        output: '@0@.xxd'.format(shaders_src[count]),
        command: [
            do_xxd, '@SOURCE_ROOT@', '@OUTDIR@', '@PLAINNAME@', '@OUTPUT@'
        ],
        depend_files: embedded_shaders_f[count]
        )
    count += 1
endforeach