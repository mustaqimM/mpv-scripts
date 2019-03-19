--	time.lua
--	'c' shows current time on keypress;                     keybind name: "show_time_fn"
--	'C' shows what the time will be at the end of playback; keybind name: "show_end_time_fn"
--	Link: https://github.com/mustaqimM/mpv-scripts/time.lua


function show_time_fn()
	mp.msg.info(os.date("%H:%M"))
	mp.osd_message(os.date("%H:%M"))
end

function show_end_time_fn()
	currentHour = tonumber(os.date("%H"))    -- Change '%H' to '%I' for 12-hr clock
	currentMinutes = tonumber(os.date("%M"))

	remainingTimeInSeconds = mp.get_property_number("time-remaining")
	remainingTimeInHours = math.floor(remainingTimeInSeconds / 3600)
	remainingTimeInMinutes = (remainingTimeInSeconds / 60) % 60

	endHour = currentHour + remainingTimeInHours
	endMin = math.floor(currentMinutes + remainingTimeInMinutes)

	if endMin >= 60 then
		endHour = math.floor(endHour + (endMin / 60))
		endMin = math.floor(endMin % 60)
	end

	mp.msg.info(string.format("Playback will end at: %02d:%02d", endHour, endMin))
	mp.osd_message(string.format("Playback will end at: %02d:%02d", endHour, endMin))
end


mp.add_key_binding("c", "show_time", show_time_fn)
mp.add_key_binding("C", "show_end_time", show_end_time_fn)
