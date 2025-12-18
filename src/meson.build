

global_dependencies += [
    dependency('boost', version: '>=1.49', modules: ['program_options'], static: build_static),
    dependency('physfs', version: '>=2.1', static: build_static),
    dependency('SDL2', static: static_win_only),
    dependency('SDL2_ttf', static: static_win_only),
    dependency('SDL2_image', static: static_win_only),
    dependency('sigc++-2.0', static: build_static),
    dependency('pixman-1', static: static_win_only),
    dependency('libpng', static: static_win_only),
    dependency('zlib', static: static_win_only),
    dependency('openal', static: static_win_only),
	dependency('vorbis', version: '>=1.3.6', static: static_win_only),
	dependency('vorbisfile', static: static_win_only),
]

fmod_arch_prefix = ''
if host_system == 'windows'
	fmod_arch_prefix = 'x64'
else
	fmod_arch_prefix = 'x86_64'
endif

if host_system == 'windows'
	global_dependencies += [dependency('bzip2')]
else
	global_dependencies += [
        compilers['cpp'].find_library('bz2'),
    ]
endif

if host_system == 'windows'
    # Newer versions of Ruby will refuse to link without these
    explicit_libs = 'libmsvcrt;libgcc;libmingwex;libgmp;'
    foreach l : explicit_libs.split(';')
            if l != ''
                global_link_args += '-l:' + l + '.a'
            endif
    endforeach
    global_dependencies += compilers['cpp'].find_library('wsock32')
    global_dependencies += compilers['cpp'].find_library('winmm')
    global_dependencies += compilers['cpp'].find_library('Secur32')
    global_dependencies += compilers['cpp'].find_library('Shlwapi')
    global_dependencies += compilers['cpp'].find_library('gdiplus')
endif


main_source = files(
    'alstream.cpp',
    'audio.cpp',
    'audiostream.cpp',
    'autotiles.cpp',
    'bitmap.cpp',
    'config.cpp',
    'etc.cpp',
    'eventthread.cpp',
    'filesystem.cpp',
    'font.cpp',
    'gl-debug.cpp',
    'gl-fun.cpp',
    'gl-meta.cpp',
    'glstate.cpp',
    'graphics.cpp',
    'i18n.cpp',
    'input.cpp',
    'keybindings.cpp',
    'main.cpp',
    'oneshot.cpp',
    'plane.cpp',
    'rgssad.cpp',
    'scene.cpp',
    'screen.cpp',
    'sdlsoundsource.cpp',
    'settingsmenu.cpp',
    'shader.cpp',
    'sharedstate.cpp',
    'soundemitter.cpp',
    'sprite.cpp',
    'table.cpp',
    'texpool.cpp',
    'tileatlas.cpp',
    'tilemap.cpp',
    'tilequad.cpp',
    'vertex.cpp',
    'viewport.cpp',
    'vorbissource.cpp',
    'window.cpp',
)

global_sources += main_source

if steam == true
    global_sources += files(
        'steam.cpp',
        '../steamshim/steamshim_child.c'
    )
    global_include_dirs += include_directories(
        '../steamshim'
    )

    global_args += '-DSTEAM'
endif

if host_system != 'windows'
    global_sources += files('xdg-user-dir-lookup.c')
endif

global_include_dirs += include_directories('.')