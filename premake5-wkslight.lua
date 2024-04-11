g_wkslight = require("premake5-modules/wkslight")
g_wkslight.workspace = {
    name = "workspace_light",
    startproject = "",
    cppdialect = "C++20",
    projects = {
        "Samples",
    },
    libraries = {
        name = "libraries",
        projects = {
            JoltPhysics = {
                location = "libraries/JoltPhysics",
                includedirs = {
                    "%{g_wkslight.librariesdir}/JoltPhysics",
                },
                links = {
                    "JoltPhysics",
                },
            },
        },
    },
}
g_wkslight.extras = {
    android = {
        androidabis = {
            --"armeabi",
            --"armeabi-v7a",
            "arm64-v8a",
            --"x86",
            --"x86_64",
        },
        androidsdkversion = "33",
        androidminsdkversion = "24",
        androidndkpath = os.getenv("ANDROID_NDK_ROOT"),
        gradleversion = "com.android.tools.build:gradle:7.0.0",
        gradlewrapper = {
            "distributionUrl=https://services.gradle.org/distributions/gradle-7.5.1-bin.zip",
        },
        androidrepositories = {
            --"jcenter()",
            --"maven { url 'http://maven.gameanalytics.com/release' }",
        },
    },
    wasm = {
        flags = (
            g_wkslight.EWasmFlag.USE_ZLIB |
            g_wkslight.EWasmFlag.USE_SDL2 |
            g_wkslight.EWasmFlag.USE_SDL_IMAGE |
            g_wkslight.EWasmFlag.USE_SDL_MIXER |
            --g_wkslight.EWasmFlag.USE_SDL_NET |
            --g_wkslight.EWasmFlag.USE_SDL_TTF |
            g_wkslight.EWasmFlag.USE_WEBGL2 |
            g_wkslight.EWasmFlag.EXPLICIT_SWAP_CONTROL |
            --g_wkslight.EWasmFlag.ASYNCIFY |
            g_wkslight.EWasmFlag.LINK_OPENAL |
            g_wkslight.EWasmFlag.NONE
        ),
        libs = {
            "idbfs.js",
            "websocket.js",
        },
        exported_runtime_methods = {
            "ccall",
            "cwrap",
        },
        exported_functions = {
            "_main",
            --"_malloc",
            --"_free",
        },
        asyncify_whitelist = {
            --"main",
        },
        image_formats = {
            "bmp",
            "jpg",
            "png",
        },
        preload_files = {
            "%{cfg.debugdir}/assets",
        },
        embed_files = {
            --"%{cfg.debugdir}/assets",
        },
        --shell_file = "%{cfg.debugdir}/platform/wasm/shell_minimal.html",
        output_file = "%{cfg.targetdir}/../../index.html",
    },
}