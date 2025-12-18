
if get_option('mri_includes') == []
    ver = get_option('mri_version')
    if ver.version_compare('>=3.0') and compilers['cpp'].get_id() == 'clang'
        global_args += '-fdeclspec'
    endif
    global_dependencies += dependency('ruby-' + ver)
else
    #global_args += ('-I' + get_option('mri_includes'))
    global_include_dirs += include_directories(get_option('mri_includes'))
    global_dependencies += compilers['cpp'].find_library(
        get_option('mri_library'), 
        dirs: get_option('mri_libpath'),
        has_headers: 'ruby.h',
        header_include_directories: [include_directories(get_option('mri_includes'))],)
endif

if host_system == 'linux'
    global_dependencies += [
        dependency('gtk+-3.0'),
        dependency('libxfconf-0'),
		dependency('dl'),
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