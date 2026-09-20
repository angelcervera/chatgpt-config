PLUGIN ?= opencode-handoff

.PHONY: validate package package-all clean

validate:
	./scripts/validate-plugin.sh $(PLUGIN)

package:
	./scripts/package-plugin.sh $(PLUGIN)

package-all:
	./scripts/package-all.sh

clean:
	rm -rf dist
