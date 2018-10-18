-- time.lua
-- 'c' shows current time on keypress; keybind name: "show_time"
-- 'C shows what the time will be at the end of playback; keybind name: "show_end_time"
-- GitHub: https://github.com/mustaqimM/mpv-scripts/time.lua

function show_time_fn()
	mp.msg.info(os.date("%H:%M"))
	mp.osd_message(os.date("%H:%M"))
end

function show_end_time_fn()
	remainingTimeInSeconds = mp.get_property_number("time-remaining")
	remainingTimeInHours = math.floor(remainingTimeInSeconds / 3600)
	remainingTimeInMinutes = (remainingTimeInSeconds / 60) % 60

	currentHour = tonumber(os.date("%I"))
	currentMinutes = tonumber(os.date("%M"))

	endHour = currentHour + remainingTimeInHours
	endMin = math.floor(currentMinutes + remainingTimeInMinutes)

	mp.msg.info(endHour .. ":" .. endMin)
	mp.osd_message("Playback will end at: " .. endHour .. ":" .. endMin)
end


mp.add_key_binding("c", "show_time", show_time_fn)
mp.add_key_binding("C", "show_end_time", show_end_time_fn)
