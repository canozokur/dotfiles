dirs = $(i3)
.PHONY : all
stow :
	stow --target $(HOME) --verbose $(stow_dirs)

.PHONY : i3
i3 :
	stow --verbose $(VERBOSITY) --target $(HOME) --verbose i3

.PHONY : dry-i3
dry-i3 :
	stow --no --target $(HOME) --verbose i3
