project(
  'gnome-calls-build',
  'c',
  default_options: {'prefix': '/', 'prefer_static': true, 'buildtype': 'release'}
)

# Must be provided to meson anyway
add_project_link_arguments(
  '-Wl,-rpath,$ORIGIN/../lib64:$ORIGIN/../../../../../lib64',
  language: 'c'
)

dep_options = {'buildtype': 'release', 'debug': false, 'default_library': 'both', 'prefer_static': true}
dep_gtk_options = {'gtk_doc': false} + dep_options
dep_prog_options = {'tests': false, 'manpages': false}

meson.override_dependency(
  'libfeedback-0.0',
  subproject(
    'feedbackd',
    default_options: {'daemon': false, 'man': false, 'tests': false} + dep_gtk_options
  ).get_variable('libfeedback_dep')
)

meson.override_dependency(
  'libcallaudio-0.1',
  subproject(
    'callaudiod',
    default_options: dep_gtk_options
  ).get_variable('libcallaudio_dep')
)

meson.override_dependency(
  'libpeas-2',
  subproject(
    'libpeas',
    default_options: {'gjs': false, 'lua51': false, 'python3': false, 'introspection': false} + dep_gtk_options
  ).get_variable('libpeas_dep')
)

meson.override_dependency(
  'gom-1.0',
  subproject(
    'gom',
    default_options: {'enable-introspection': false, 'enable-gtk-doc': false} + dep_options
  ).get_variable('libgom_dep')
)

meson.override_dependency(
  'folks',
  subproject(
    'folks',
    default_options: {'telepathy_backend': false, 'inspect_tool': false, 'import_tool': false, 'bluez_backend': false, 'tests': false} + dep_options
  ).get_variable('libfolks_dep')
)

gnome_calls = subproject(
  'calls',
  default_options: {'gst_debug': false} + dep_gtk_options + dep_prog_options
)
