mods := CopyInserters SphereProgress
objs := $(foreach mod,$(mods),$(mod)/bin/Release/$(mod).dll)

all: $(objs)

.PHONY: install clean

install: $(objs)
	mv $^ "$(HOME)/.local/share/Steam/steamapps/common/Dyson Sphere Program/BepInEx/plugins"

CopyInserters/bin/Release/CopyInserters.dll: CopyInserters/CopyInserters.csproj
	msbuild $< -p:Configuration=Release

SphereProgress/bin/Release/SphereProgress.dll: SphereProgress/SphereProgress.csproj
	msbuild $< -p:Configuration=Release

clean:
	-rm -rf */bin/ */obj/
