#this gives me colored output in the terminal
if (Sys.getenv("TERM") == "screen-256color") library("colorout")

#This allows for tab completion in library calls
utils::rc.settings(ipck = TRUE)

options(editor = "vim")

#This makes it so that I am not asked to save my workspace on quit
q <- function(save = "no", ...) {
        quit(save = save, ...)
}
