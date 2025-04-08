allDirs = i3 nvim bash zellij wezterm git sway kanshi
t = $(error Please set t=<target> to the target you're building)
.DEFAULT_GOAL := dry-all
.PHONY : all
all :
	stow --target $(HOME) --verbose $(allDirs)

.PHONY : dry-all
dry-all :
	stow --no --target $(HOME) --verbose $(allDirs)

swayDirs = nvim bash zellij wezterm git sway kanshi
.PHONY : sway
sway :
	stow --target $(HOME) --verbose $(swayDirs)

.PHONY : dry-sway
dry-sway :
	stow --no --target $(HOME) --verbose $(swayDirs)

i3Dirs = nvim bash zellij wezterm git i3
.PHONY : i3
i3 :
	stow --target $(HOME) --verbose $(i3Dirs)

.PHONY : dry-i3
dry-i3 :
	stow --no --target $(HOME) --verbose $(i3Dirs)

.PHONY : run
run :
	stow --verbose $(VERBOSITY) --target $(HOME) --verbose $(t)

.PHONY : dry-run
dry-run :
	stow --no --target $(HOME) --verbose $(t)
