# look at the toolchains registered in the workspace file with nodejs_register_toolchains

# the name can be anything the user wants this is just added to the target to create unique names
# the order will match against the order in the TOOLCHAIN_VERSION list.
TOOLCHAINS_NAMES = [
    "node18",
    "node20",
]

# this is the list of toolchains that should be used and are registered with nodejs_register_toolchains in the WORKSPACE file
TOOLCHAINS_VERSIONS = [
    select({
        "@bazel_tools//src/conditions:linux_x86_64": "@node18_linux_amd64//:node_toolchain",
        "@bazel_tools//src/conditions:darwin": "@node18_darwin_amd64//:node_toolchain",
        "@bazel_tools//src/conditions:windows": "@node18_windows_amd64//:node_toolchain",
    }),
    select({
        "@bazel_tools//src/conditions:linux_x86_64": "@node20_linux_amd64//:node_toolchain",
        "@bazel_tools//src/conditions:darwin": "@node20_darwin_amd64//:node_toolchain",
        "@bazel_tools//src/conditions:windows": "@node20_windows_amd64//:node_toolchain",
    }),
]

# A default toolchain for use when only one is necessary
DEFAULT_TOOLCHAIN_VERSION = TOOLCHAINS_VERSIONS[len(TOOLCHAINS_VERSIONS) - 1]
