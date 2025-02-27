dirs = $(i3 nvim bash zellij wezterm)
t = $(error Please set t=<target> to the target you're building)
.PHONY : all
all :
	stow --target $(HOME) --verbose $(stow_dirs)

.PHONY : dry-all
dry-all :
	stow --no --target $(HOME) --verbose $(stow_dirs)

.PHONY : run
run :
	stow --verbose $(VERBOSITY) --target $(HOME) --verbose $(t)

.PHONY : dry-run
dry-run :
	stow --no --target $(HOME) --verbose $(t)
