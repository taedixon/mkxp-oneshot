
project(
    'sdlsound_2',
    'c'
)

compilers = {
    'c': meson.get_compiler('c')
}

sdlsound_source = files(
    'SDL_sound_aiff.c',
    'SDL_sound_au.c',
    'SDL_sound.c',
    'SDL_sound_coreaudio.c',
    'SDL_sound_flac.c',
    'SDL_sound_midi.c',
    'SDL_sound_modplug.c',
    'SDL_sound_mp3.c',
    'SDL_sound_raw.c',
    'SDL_sound_shn.c',
    'SDL_sound_voc.c',
    'SDL_sound_vorbis.c',
    'SDL_sound_wav.c',
)
inc = include_directories('.')
c_flags = [
    '-DNDEBUG'
]
dependencies = [
    dependency('SDL2')
]
# for DECLSPEC:
c_flags += ['-DBUILD_SDL', '-DSDL_SOUND_DLL_EXPORTS']
c_flags += [
    '-DSOUND_SUPPORTS_MP3=0',
    '-DSOUND_SUPPORTS_MODPLUG=0',
    '-DSOUND_SUPPORTS_MIDI=0',
    '-DSOUND_SUPPORTS_AIFF=0',
    '-DSOUND_SUPPORTS_AU=0',
    '-DSOUND_SUPPORTS_VOC=0',
    '-DSOUND_SUPPORTS_SHN=0',
    '-DSOUND_SUPPORTS_RAW=0',
    '-DSOUND_SUPPORTS_FL=0',
]

sdlsound_lib = shared_library(
    'sdlsound_2',
    sources: sdlsound_source,
    dependencies: dependencies,
    include_directories: inc,
    c_args: c_flags,
    install: true,

)

sdlsound_dep = declare_dependency(include_directories : inc,
  link_with : sdlsound_lib)