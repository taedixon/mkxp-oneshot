
global_dependencies += [
    dependency('ruby-3.0'),
]

if host_system == 'linux'
    global_dependencies += [
        dependency('gtk+-2.0'),
        dependency('libxfconf-0'),
    ]
endif

binding_mri_source = files(
    'audio-binding.cpp',
    'binding-mri.cpp',
    'binding-util.cpp',
    'bitmap-binding.cpp',
    'chroma-binding.cpp',
    'etc-binding.cpp',
    'filesystem-binding.cpp',
    'font-binding.cpp',
    'graphics-binding.cpp',
    'input-binding.cpp',
    'journal-binding.cpp',
    'module_rpg.cpp',
    'niko-binding.cpp',
    'oneshot-binding.cpp',
    'plane-binding.cpp',
    'screen-binding.cpp',
    'sprite-binding.cpp',
    'steam-binding.cpp',
    'table-binding.cpp',
    'tilemap-binding.cpp',
    'viewport-binding.cpp',
    'wallpaper-binding.cpp',
    'window-binding.cpp',
)

global_sources += binding_mri_source
global_include_dirs += include_directories('.')