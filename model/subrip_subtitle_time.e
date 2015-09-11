note
	description: "Class that represents the time as used in subtitles in SubRip format."
	author: "DOSE 2015, Rio Cuarto Team"
	date: "September 2015"
	revision: "0.1"

class
	SUBRIP_SUBTITLE_TIME

create
	make, make_with_values

feature -- Initialisation

	make
			-- Creates time with default values hh:mm:ss:mmmm
		do
		ensure
			hours=0 and
			minutes=0 and
			seconds=0 and
			milliseconds=0
		end

	make_with_values (new_hours: INTEGER; new_minutes: INTEGER; new_seconds: INTEGER; new_mil: INTEGER)
			-- Creates time with provided values for hours, minutes, etc.
		require
			valid_hours: (new_hours < 24) and (new_hours >= 0)
			valid_minutes: (new_minutes < 60) and (new_minutes >= 0)
			valid_seconds: (new_seconds < 60) and (new_seconds >= 0)
			valid_milliseconds: (new_mil < 1000) and (new_mil >= 0)
		do
			hours := new_hours
			minutes := new_minutes
			seconds := new_seconds
			milliseconds := new_mil
		ensure
			hours=new_hours and
			minutes=new_minutes and
			seconds=new_seconds and
			milliseconds=new_mil
		end

feature -- Status setting

	set_hour (new_hour: INTEGER)
			-- sets hours to provided value

		require (new_hour < 24) and (new_hour >= 0)
		do
			hours:= new_hour
		end

	set_minute (new_minute: INTEGER)
			-- sets minutes to provided value
		require (new_minute < 60) and (new_minute >= 0)
		do
			minutes:= new_minute
		end

	set_seconds (new_seconds: INTEGER)
			-- sets seconds to provided value
		require (new_seconds < 60) and (new_seconds >= 0)
		do
			seconds:= new_seconds
		end

	set_milliseconds (new_milliseconds: INTEGER)
			-- sets milliseconds to provided value
		require
			(new_milliseconds >= 0) and (new_milliseconds < 1000)
		do
			milliseconds := new_milliseconds

		ensure
			milliseconds = new_milliseconds
		end

	move_forward (new_milliseconds: INTEGER)
			-- Moves the time forward the number of provided milliseconds
		require
			valid_milliseconds: new_milliseconds > 0
		local
			remainder_hours,remainder_minutes:INTEGER
		do
			hours := hours + new_milliseconds//3600000
			remainder_hours := new_milliseconds\\3600000;

			minutes := minutes + remainder_hours//60000
			remainder_minutes := remainder_hours\\60000;

			seconds := seconds + remainder_minutes//1000
			milliseconds := milliseconds + remainder_minutes\\1000
		ensure
			hours = hours + new_milliseconds//3600000
			minutes = minutes + (new_milliseconds\\3600000)//60000
			seconds = seconds + (new_milliseconds\\3600000)//1000
			milliseconds = milliseconds + 	(new_milliseconds\\3600000)\\1000
		end

	rewind (offset_milliseconds: INTEGER)
			-- Moves the time backward the numbe of provided milliseconds
		do

		end

feature -- Status report

	hours: INTEGER
			-- hours of the time

	minutes: INTEGER
			-- minutes of the time

	seconds: INTEGER
			-- seconds of the time

	milliseconds: INTEGER
			-- milliseconds of the time

invariant

end
