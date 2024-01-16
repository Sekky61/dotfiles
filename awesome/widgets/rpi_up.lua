local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
require("status.rpi_up")

local icon = {
    widget = wibox.container.place,
    {
        widget = wibox.widget.imagebox,
        image = os.getenv("HOME") .. "/.config/awesome/theme/icons/pi.svg",
        forced_width = 15,
        resize = true,
    },
}

local bg_shape = function (cr, w, h) gears.shape.rounded_rect(cr, w, h, 3) end

local rpi_up = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "-"
}

local widget = {
    widget = wibox.container.margin,
    top = 6,
    bottom = 6,

    {
        widget = wibox.container.background,
        bg = "#44475a",
        shape = bg_shape,
        {
            widget = wibox.container.margin,
            left = 5,
            right = 5,

            {
                widget = wibox.container.place,
                layout = wibox.layout.fixed.horizontal,
                spacing = 5,

                icon,
                rpi_up
            }
        },
    },
}

awesome.connect_signal("status::rpi_up", function(up)
    rpi_up.font = beautiful.font
    --
    local online = up and "Online" or "Offline"
    local markup = online
    rpi_up.markup = markup
end)

return widget
