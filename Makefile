dirs = $(i3 nvim bash zellij)
t = $(error Please set t=<target> to the target you're building)
.PHONY : all
stow :
	stow --target $(HOME) --verbose $(stow_dirs)

.PHONY : run
run :
	stow --verbose $(VERBOSITY) --target $(HOME) --verbose $(t)

.PHONY : dry-run
dry-run :
	stow --no --target $(HOME) --verbose $(t)
