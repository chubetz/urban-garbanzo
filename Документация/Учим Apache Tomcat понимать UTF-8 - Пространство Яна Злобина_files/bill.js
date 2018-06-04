var billEpoch = 0;
var serverEpoch = 0;
var counter = 0;
var billAgeDiv;

function start ()
{
	init ();

	window.setInterval ("printBillAge (age (billAge ()));", 1000);
}

function printBillAge (age)
{
	billAgeDiv.innerHTML = age;
}

function age (date)
{
	var useEndString;
	var day;
	var hour;
	var minute;
	var second;
	var ageBuffer;
	var devider;
	var minText;
	var endText;

	ageBuffer = "";
	useEndString = true;
	day = parseInt (date / 3600 / 24, 10);
	hour = parseInt (date / 3600, 10) - parseInt (day * 24, 10);
	minute = parseInt (date / 60, 10) - (day * 24) - (hour * 60);
	second = parseInt (date, 10);
	
	devider = " ";
	minText = "Меньше 10 секунд";
	endText = " назад";
	
	if (day > 0)
	{
		if (day == 1)
		{
			ageBuffer += "Вчера";
			useEndString = false;
		}
		else if (day == 2)
		{
			ageBuffer += "Позавчера";
			useEndString = false;
		}
		else
		{
			ageBuffer += dayString (day);
			ageBuffer += devider;
		}
	}
	else
	{
		if (hour > 0)
		{
			ageBuffer += hourString (hour);
			ageBuffer += devider;
			
			if (hour == 1)
			{
				if (minute > 0)
				{
					ageBuffer += minuteString (minute);
					ageBuffer += devider;
				}
			}
		}
		else
		{
			if (minute > 0)
			{
				ageBuffer += minuteString (minute);
				ageBuffer += devider;
			}
			else
			{
				if (second > 10)
				{
					ageBuffer += secondString (second);
				}
				else
				{
					ageBuffer += minText;
				}
			}
		}
	}

	if (useEndString)
	{
		ageBuffer += endText;
	}

	return ageBuffer;
}

function dayString (day)
{
	var text;
	var dayLastDigit;
	
	dayLastDigit = lastDigit (day);
	
	if ((dayLastDigit < 1) || (dayLastDigit > 4 && dayLastDigit <= 9) || (day > 9 && day < 21))
	{
		text = " дней";
	}
	else if (dayLastDigit == 1)
	{
		text = " день";
	}
	else if (dayLastDigit < 5)
	{
		text = " дня";
	}

	return day + text;
}

function hourString (hour)
{
	var text;
	var hourLastDigit;
	
	hourLastDigit = lastDigit (hour);
	
	if ((hourLastDigit < 1) || (hourLastDigit > 4 && hourLastDigit <= 9) || (hour > 9 && hour < 21))
	{
		text = " часов";
	}
	else if (hourLastDigit == 1)
	{
		text = " час";
	}
	else if (hourLastDigit < 5)
	{
		text = " часа";
	}
	
	return hour + text;
}

function minuteString (minute)
{
	var text;
	var minuteLastDigit;
	
	minuteLastDigit = lastDigit (minute);
	
	if ((minuteLastDigit < 1) || (minuteLastDigit > 4 && minuteLastDigit <= 9) || (minute > 9 && minute < 21))
	{
		text = " минут";
	}
	else if (minuteLastDigit == 1)
	{
		text = " минута";
	}
	else if (minuteLastDigit < 5)
	{
		text = " минуты";
	}

	return minute + text;
}

function secondString (second)
{
	var text;
	var secondLastDigit;
	
	secondLastDigit = lastDigit (second);
	
	if ((secondLastDigit < 1) || (secondLastDigit > 4 && secondLastDigit <= 9) || (second > 9 && second < 21))
	{
		text = " секунд";
	}
	else if (secondLastDigit == 1)
	{
		text = " секунда";
	}
	else if (secondLastDigit < 5)
	{
		text = " секунды";
	}
	
	return second + text;
}

function lastDigit (arg)
{
	var first;
	var last;
	
	first = parseFloat (parseInt (parseFloat (arg / 10)), 10);
	last = arg - (first * 10);
	
	return last;
}

function init ()
{
	billEpoch = parseInt (document.getElementById ("ageEpoch").innerHTML, 10);
	serverEpoch = parseInt (document.getElementById ("currentEpoch").innerHTML, 10);
	billAgeDiv = document.getElementById ("age");
}

function billAge ()
{
	var result = 0;
	
	result = serverEpoch + counter - billEpoch;
	counter++;
	
	return result;
}

