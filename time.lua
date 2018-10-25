function show_time_fn()
	mp.msg.info(os.date("%H:%M"))
	mp.osd_message(os.date("%H:%M"))
end

function show_end_time_fn()
	currentHour = tonumber(os.date("%I"))
	currentMinutes = tonumber(os.date("%M"))

	remainingTimeInSeconds = mp.get_property_number("time-remaining")

	remainingTimeInHours = math.floor(remainingTimeInSeconds / 3600)
	remainingTimeInMinutes = (remainingTimeInSeconds / 60) % 60

	endHour = math.floor(remainingTimeInHours + currentHour)
	endMin = math.floor(remainingTimeInMinutes + currentMinutes)

	if endMin >= 60 then
		endHour = math.floor(endHour + (endMin / 60))
		endMin = math.floor(endMin % 60)
	end

	mp.msg.info(endHour .. ":" .. endMin)
	mp.osd_message("Playback will end at: " .. endHour .. ":" .. endMin)
end


mp.add_key_binding("b", "show_time", show_time_fn)
mp.add_key_binding("B", "show_end_time", show_end_time_fn)
