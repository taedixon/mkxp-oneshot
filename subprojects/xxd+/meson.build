
project(
    'xxd+',
    'cpp',
	version: '1.0.0',
)

compilers = {
    'cpp': meson.get_compiler('cpp')
}

xxd_binary = executable(
    'xxd',
    sources: files('main.cpp'),
	dependencies: [dependency('Qt5Core')],
	cpp_args: ['-fPIC'],
    install: false,

)