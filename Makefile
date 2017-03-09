dotfilesdir	:= ~/dotfiles/
symdir		:= ~/
extension	:= .ln

# find all .symlink files recursively with shell command find
symrpath	:= $(patsubst ./%,%,$(shell find . -path ./.git -prune -o -name "*$(extension)" -print | sort -r))
symapath	:= $(addprefix $(dotfilesdir),$(symrpath))
symhpath	:= $(addprefix $(symdir).,$(notdir $(subst $(extension),,$(symrpath))))
INDEX		= 1

help:
	@printf "\e[94m\e[7m"
	@printf "              ===========================                      \n"
	@printf "              | DOTFILES MAKEFILE USAGE |                      \n"
	@printf "              ===========================                      \n"
	@printf " make backup : move previous corresping dotfiles to ~/.backup. \n"
	@printf " make link   : symlink from *.symlink to dotfiles.             \n"
	@printf " make re     : backup and link.                                \n"
	@printf "\e[27m\n"

.PHONY: link update backup help

link: $(symhpath)

$(symhpath):
	@#$(eval stem=$(patsubst .%,%,$(notdir $(addsuffix $(extension),$@))))
	@#$(eval source=$(filter %$(stem),$(symapath)))
	@$(eval source=$(word $(INDEX),$(symapath)))
	@# Start of linkage message
	@$(if $(filter 1,$(INDEX)),printf "\e[4mGoing to link your config files now:\e[24m\n")
	@# Different printf for even/odd INDEX
	$(if $(filter 1,$(shell expr $(INDEX) % 2)),\
		@printf "\e[38;5;239m",\
		@printf "\e[38;5;246m")
	@# Different printf for INDEX=0
	$(if $(filter 1,$(INDEX)),\
		@printf "$@\t ➔  $(shell echo $(source))\n",\
		@printf "%*s%s\t ➔  %*s%s\n" \
		$(shell expr $(shell echo $(dir $@) | wc -c) - 1) " " $(notdir $@) \
		$(shell expr $(shell echo $(dotfilesdir) | wc -c) - 1) " "\
		$(word $(INDEX),$(symrpath)))
	@ln -sf $(source) $@
	@# Increment INDEX
	@$(eval INDEX=$(shell expr $(INDEX) + 1))

backup:
	@mkdir -p ~/.backup
	$(foreach file,$(symhpath), $(shell mv -f $(file) ~/.backup/ 2>&-\
   	   || rm $(file) 2>&-))
	@printf "👌 Backed up all corresponding dotfiles in ~/.backup\n"

re: backup link
