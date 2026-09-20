PLUGIN ?= opencode-handoff
SKILL ?= opencode-handoff

.PHONY: validate package package-skill package-all clean

validate:
	./scripts/validate-plugin.sh $(PLUGIN)

package:
	./scripts/package-plugin.sh $(PLUGIN)

package-skill:
	./scripts/package-skill.sh $(PLUGIN) $(SKILL)

package-all:
	./scripts/package-all.sh

clean:
	rm -rf dist
