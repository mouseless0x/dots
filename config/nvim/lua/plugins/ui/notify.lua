return {
	"rcarriga/nvim-notify",
	opts = {
		background_colour = "NotifyBackground",
		fps = 60,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = 2,
		minimum_width = 50,
		render = "minimal",
		stages = "static",
		time_formats = {
			notification = "%T",
			notification_history = "%FT%T",
		},
		timeout = 2000,
		top_down = true,
	},
}
