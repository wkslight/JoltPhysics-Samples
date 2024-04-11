project("Samples")
    location(path.join(g_wkslight.workspacedir, "%{prj.name}"))
    targetdir(g_wkslight.targetdir)
    kind("ConsoleApp")
    language("C++")
    debugdir(path.join(g_wkslight.workspacedir, ".."))
    debugargs({
        --"--foobar",
    })
    files({
        "src/**.h",
        "src/**.cpp",
    })
    includedirs({
        "src",
        "src/TestFramework",
    })
    links({
        "shcore.lib",
        "dinput8.lib",
        "dxguid.lib",
        "dxgi.lib",
        "d3dcompiler.lib",
        "d3d12.lib",
    })
    g_wkslight.libs({
        "JoltPhysics",
    })