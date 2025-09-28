global_sources += custom_target('pack scripts',
    output: 'xScripts.rxdata',
    command: [
            ruby,
            meson.global_source_root() + '/rpgscript.rb',
            meson.current_source_dir(),
            '@OUTPUT@'
        ],
    install: true,
    install_dir: 'Data',
    build_always_stale: true
)