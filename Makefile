linuxDirs = i3 nvim bash zellij wezterm git sway kanshi
t = $(error Please set t=<target> to the target you're building)
.DEFAULT_GOAL := dry-linux
.PHONY : linux
linux :
	stow --target $(HOME) --verbose $(linuxDirs)

.PHONY : dry-linux
dry-linux :
	stow --no --target $(HOME) --verbose $(linuxDirs)

.PHONY : run
run :
	stow --verbose $(VERBOSITY) --target $(HOME) --verbose $(t)

.PHONY : dry-run
dry-run :
	stow --no --target $(HOME) --verbose $(t)
