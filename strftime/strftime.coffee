_f =
  d: (date) ->
    d = date.getDate()
    if d.length is 1 then d = "0#{d}"
    d

  D: (date) ->
    switch date.getDay()
      when 0 then "Sun"
      when 1 then "Mon"
      when 2 then "Tue"
      when 3 then "Wed"
      when 4 then "Thu"
      when 5 then "Fri"
      when 6 then "Sat"

  j: (date) ->
    date.getDate()

  l: (date) ->
    switch date.getDay()
      when 0 then "Sunday"
      when 1 then "Monday"
      when 2 then "Tuesday"
      when 3 then "Wednesday"
      when 4 then "Thursday"
      when 5 then "Friday"
      when 6 then "Saturday"

  N: (date) ->
    d = date.getDay()
    d = 7 if d is 0
    d

  S: (date) ->
    d = date.getDate()
    m = d % 10
    if m is 1 and d isnt 11 then return "st"
    if m is 2 and d isnt 12 then return "nd"
    if m is 3 and d isnt 13 then return "rd"
    "th"

  w: (date) ->
    date.getDay()

  z: (date) ->
    # adapted from
    # http://stackoverflow.com/questions/8619879/javascript-calculate-days-in-a-year-year-to-date/8620357#8620357
    d = new Date date.getFullYear(), 0, 0
    Math.floor((date-d) / 8.64e+7)

  W: (date) ->
    # adapted from `z: (date) ->`
    d = new Date date.getFullYear(), 0, 0
    Math.floor((date-d) / (8.64e+7 * 7))

  F: (date) ->
    switch date.getMonth()
      when  0 then "January"
      when  1 then "February"
      when  2 then "March"
      when  3 then "April"
      when  4 then "May"
      when  5 then "June"
      when  6 then "July"
      when  7 then "August"
      when  8 then "Septempter"
      when  9 then "October"
      when 10 then "November"
      when 11 then "December"

  m: (date) ->
    d = date.getMonth() + 1
    d = "0#{d}" if d.length is 1
    d

  M: (date) ->
    switch date.getMonth()
      when  0 then "Jan"
      when  1 then "Feb"
      when  2 then "Mar"
      when  3 then "Apr"
      when  4 then "May"
      when  5 then "Jun"
      when  6 then "Jul"
      when  7 then "Aug"
      when  8 then "Sep"
      when  9 then "Oct"
      when 10 then "Nov"
      when 11 then "Dec"

  n: (date) ->
    date.getMonth() + 1

  t: (date) ->
    # adapted from
    # http://stackoverflow.com/questions/1184334/get-number-days-in-a-specified-month-using-javascript/1184359#1184359
    new Date(date.getFullYear(), date.getMonth()+1, 0).getDate()

  L: (date) ->
    # adapted from
    # http://stackoverflow.com/questions/8175521/javascript-to-find-leap-year/8175905#8175905
    new Date(date.getFullYear, 1, 29).getMonth() is 1

  o: (date) ->
    # probably incorrect?
    # ISO-8601 year number. This has the same value as Y, except that if the ISO week number (W) 
    # belongs to the previous or next year, that year is used instead. (added in PHP 5.1.0) 
    # Examples: 1999 or 2003
    @Y(date)

  Y: (date) ->
    date.getFullYear()

  y: (date) ->
    date.getFullYear().toString().substr 2, 2



"""
REMAINING FUNCTIONALITY
Time	---	---
a	Lowercase Ante meridiem and Post meridiem	am or pm
A	Uppercase Ante meridiem and Post meridiem	AM or PM
B	Swatch Internet time	000 through 999
g	12-hour format of an hour without leading zeros	1 through 12
G	24-hour format of an hour without leading zeros	0 through 23
h	12-hour format of an hour with leading zeros	01 through 12
H	24-hour format of an hour with leading zeros	00 through 23
i	Minutes with leading zeros	00 to 59
s	Seconds, with leading zeros	00 through 59
u	 Microseconds (added in PHP 5.2.2). Note that date() will always generate 000000 since it takes an integer parameter, whereas DateTime::format() does support microseconds.	Example: 654321
Timezone	---	---
e	Timezone identifier (added in PHP 5.1.0)	Examples: UTC, GMT, Atlantic/Azores
I (capital i)	Whether or not the date is in daylight saving time	1 if Daylight Saving Time, 0 otherwise.
O	Difference to Greenwich time (GMT) in hours	Example: +0200
P	Difference to Greenwich time (GMT) with colon between hours and minutes (added in PHP 5.1.3)	Example: +02:00
T	Timezone abbreviation	Examples: EST, MDT ...
Z	Timezone offset in seconds. The offset for timezones west of UTC is always negative, and for those east of UTC is always positive.	-43200 through 50400
Full Date/Time	---	---
c	ISO 8601 date (added in PHP 5)	2004-02-12T15:19:21+00:00
r	» RFC 2822 formatted date	Example: Thu, 21 Dec 2000 16:01:07 +0200
U       Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT)
"""


strftime = (date, fmt) ->
  fmt = fmt.split ""
  esc = no
  result = []
  for char in fmt
    if esc
      esc = no
      result.push char
    else
      if _f[char]
        result.push _f[char](date)
      else if char is "\\"
        esc = yes
      else
        result.push char
  result.join ""


Date.prototype.strftime = (fmt) -> strftime @, fmt

