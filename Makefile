mods := PlanetMiner
objs := $(foreach mod,$(mods),$(mod)/bin/Release/$(mod).dll)

all: $(objs)

.PHONY: install clean

install: $(objs)
	mv $^ "$(HOME)/.local/share/Steam/steamapps/common/Dyson Sphere Program/BepInEx/plugins"

PlanetMiner/bin/Release/PlanetMiner.dll: PlanetMiner/PlanetMiner.csproj
	msbuild $< -p:Configuration=Release

clean:
	-rm -rf */bin/ */obj/
