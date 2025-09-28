embedded_assets = [
    'icon.png',
    'gamecontrollerdb.txt'
]

embedded_assets_f = files(embedded_assets)

count = 0
foreach file : embedded_assets_f
    global_sources += custom_target(embedded_assets[count],
    input: file,
    output: '@0@.xxd'.format(embedded_assets[count]),
    command: [
        do_xxd, '@SOURCE_ROOT@', '@OUTDIR@', '@PLAINNAME@', '@OUTPUT@'
    ],
    depend_files: embedded_assets_f[count]
    )
    count += 1
endforeach