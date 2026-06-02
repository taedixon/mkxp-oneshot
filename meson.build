# ModShot Meson project build file
project(
    'oneshot',
    ['c', 'cpp'],
    version: '1.0.0',
    license: 'GPL-2.0',
    meson_version: '>=0.60.0',
    default_options: [
        'cpp_std=c++17',
        'buildtype=release'
    ]
)

host_system = host_machine.system()

compilers = {
    'cpp': meson.get_compiler('cpp')
}

xxd_proj = subproject('xxd+')
xxd = xxd_proj.get_variable('xxd_binary')
# do_xxd = files('do_xxd.sh')
bash = find_program('bash')
ruby = find_program('ruby', native: true, dirs: get_option('mri_bin'))

global_sources = []
global_dependencies = []
global_include_dirs = []
global_args = []
global_link_args = []

sizeof = {
    'void*': compilers['cpp'].sizeof('void*'),
    'long': compilers['cpp'].sizeof('long')
}
win64 = (sizeof['void*'] != sizeof['long'])

global_args += '-DHAVE_NANOSLEEP'
global_args += '-DONESHOT_DISABLE_GLDEBUG'

gfx_backend = get_option('gfx_backend')
if gfx_backend == 'gles'
    global_args += '-DGLES2_HEADER'
elif gfx_backend == 'gl'
    global_dependencies += dependency('gl')
endif

# ====================
# Main source
# ====================

# Suppress warnings
global_args += [
    '-Wno-non-virtual-dtor',
#    '-Wno-reorder',
#    '-Wno-uninitialized',
#    '-Wno-unknown-pragmas',
#    '-Wno-stringop-truncation',
#    '-Wno-parentheses',
#    '-Wno-sign-compare',
#    '-Wno-misleading-indentation'
]

if compilers['cpp'].get_id() == 'clang'
    global_args += [
        '-Wno-undefined-var-template',
        '-Wno-delete-non-abstract-non-virtual-dtor'
    ]
endif

if host_system == 'windows'
	# Force usage of wchar syscalls in windows/mingw builds
	global_args += '-DUNICODE'
	# Per windows:
	#     "Math Constants are not defined in Standard C/C++. 
	#     To use them, you must first define _USE_MATH_DEFINES 
	#     and then include cmath or math.h."
	global_args += '-D_USE_MATH_DEFINES'
    # Win32 Subsystem and Operating System version
    # (default: 6.00 - Windows Vista/7 and higher)
    winnt_ver_args = [
        '-Wl,--major-subsystem-version=6',
        '-Wl,--minor-subsystem-version=0',
        '-Wl,--major-os-version=6',
        '-Wl,--minor-os-version=0'
    ]
    global_link_args += winnt_ver_args

    if compilers['cpp'].get_id() != 'clang'
        global_args += '-masm=intel'
    endif
endif

# Defines
if get_option('workdir_current')
    global_args += '-DWORKDIR_CURRENT'
endif

steam = get_option('steam')

build_static = get_option('build_static')
static_win_only = false
if host_system == 'windows'
	static_win_only = build_static
endif

# Project subdirectories
subdir('src')
subdir('binding-mri')
subdir('shader')
subdir('assets')
subdir('scripts')

sdlsound_proj = subproject('sdlsound_2')
global_dependencies += [sdlsound_proj.get_variable('sdlsound_dep')]


global_include_dirs += include_directories('binding-mri')

rpath = ''
if host_system == 'windows'
    subdir('windows')
    global_sources += windows_resources
    global_include_dirs += include_directories('windows')
else
    #subdir('linux')
    rpath = '$ORIGIN'
endif

exe_name = meson.project_name()


if get_option('copy_gamefiles')
	# Copy game files to the build directory
	install_subdir(
		'oneshot',
		install_dir: '',
		strip_directory: true,
	)
endif

# OneShot Build
executable(
    exe_name,
    sources: global_sources,
    dependencies: global_dependencies,
    include_directories: global_include_dirs,
    install_rpath: rpath,
    link_args: global_link_args,
    cpp_args: global_args,
    objc_args: global_args,
    objcpp_args: global_args,
    win_subsystem: 'windows',
    install: true,
)