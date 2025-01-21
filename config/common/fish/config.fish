if status is-interactive
    # Unset Greeting
    set fish_greeting

	# Fish abbreviations
    abbr -a n nvim

	# Use Vim Bindings
	fish_vi_key_bindings
    set fish_cursor_default     block      blink
    set fish_curor_insert 	    line       blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual      block

	function fish_user_key_bindings
		bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
        bind -M insert \cf "tmux-sessionizer"
        bind -M insert \cw "tmux-windownizer"
	end

	function last_history_item
        echo $history[1]
    end

	# Add bash's !! binding to fish
    abbr -a !! --position anywhere --function last_history_item

    # Paths
    fish_add_path /opt/homebrew/sbin
    fish_add_path /opt/homebrew/bin
    fish_add_path ~/.bun/bin/
    fish_add_path ~/.huff/bin/
    fish_add_path ~/.foundry/bin/
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.local/bin

    starship init fish | source
end

fish_add_path -a /Users/mous/.foundry/bin

fish_add_path -a /Users/mous/.foundry/bin
