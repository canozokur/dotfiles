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

.PHONY : nvim
nvim :
	stow --verbose $(VERBOSITY) --target $(HOME) --verbose nvim

.PHONY : dry-nvim
dry-nvim :
	stow --no --target $(HOME) --verbose nvim
