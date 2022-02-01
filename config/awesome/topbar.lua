local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local topbar = {}

function topbar.shape_create(cairocanv, width, height)
	gears.shape.rounded_rect(cairocanv, width, height, 5)
end

topbar.create = function (screen_s) 
	local bar = awful.wibar({position="top", screen = screen_s, shape=topbar.shape_create}) 

	--- Add functions
        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        bar.layoutbox = awful.widget.layoutbox(screen_s)
        bar.layoutbox:buttons(
            gears.table.join(
                awful.button(
                    {},
                    1,
                    function()
                        awful.layout.inc(1)
                    end
                ),
                awful.button(
                    {},
                    3,
                    function()
                        awful.layout.inc(-1)
                    end
                ),
                awful.button(
                    {},
                    4,
                    function()
                        awful.layout.inc(1)
                    end
                ),
                awful.button(
                    {},
                    5,
                    function()
                        awful.layout.inc(-1)
                    end
                )
            )
        )

        -- Create a taglist widget
        bar.taglist =
            awful.widget.taglist {
            screen = screen_s,
            filter = awful.widget.taglist.filter.all,
            buttons = taglist_buttons
        }

		-- Setup the bar
		-- Add the widgets to it
		bar:setup {
			layout = wibox.layout.align.horizontal,
			{
				layout = wibox.layout.fixed.horizontal,
				bar.taglist
			},
			layout = wibox.layout.align.horizontal,
			{
				layout = wibox.layout.fixed.horizontal,
				bar.layoutbox
			}
		}


	return bar
end

return topbar
