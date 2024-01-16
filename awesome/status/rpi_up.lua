local awful = require("awful")

local interval = 30

awful.widget.watch("bash -c rpi_running", interval, function(_, stdout, _, _, exitcode)
    -- send on or off signal
    awesome.emit_signal("status::rpi_up", exitcode == 0)
end)
