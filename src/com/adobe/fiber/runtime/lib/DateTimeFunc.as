package com.adobe.fiber.runtime.lib
{
   import mx.resources.ResourceManager;
   
   //[ResourceBundle("fiber")]
   public class DateTimeFunc
   {
      
      private static var months:Array = [31,28,31,30,31,30,31,31,30,31,30,31];
      
      private static const MILLISECONDS_PER_MINUTE:int = 1000 * 60;
      
      private static const MILLISECONDS_PER_HOUR:int = 1000 * 60 * 60;
      
      private static const MILLISECONDS_PER_DAY:int = 1000 * 60 * 60 * 24;
      
      private static const SUNDAY:int = 0;
      
      private static const MONDAY:int = 1;
      
      private static const TUESDAY:int = 2;
      
      private static const WEDNESDAY:int = 3;
      
      private static const THURSDAY:int = 4;
      
      private static const FRIDAY:int = 5;
      
      private static const SATURDAY:int = 6;
       
      
      public function DateTimeFunc()
      {
         super();
      }
      
      public static function now() : Date
      {
         return new Date();
      }
      
      public static function today() : Date
      {
         return new Date();
      }
      
      public static function createDate(year:int, month:int, day:int, hour:int, minute:int, second:int, millisecond:int = 0) : Date
      {
         return new Date(year,month - 1,day,hour,minute,second,millisecond);
      }
      
      public static function createDateUTC(year:int, month:int, day:int, hour:int, minute:int, second:int, millisecond:int = 0) : Date
      {
         return new Date(Date.UTC(year,month - 1,day,hour,minute,second,millisecond));
      }
      
      public static function dateAdd(part:String, units:int, date:Date) : Date
      {
         var month:int = 0;
         var year:int = 0;
         var y_amount:int = 0;
         var day:int = 0;
         var dayOfWeek:int = 0;
         var offset:Number = NaN;
         var newDate:Date = null;
         var x1:int = 0;
         var x2:int = 0;
         var x3:int = 0;
         var x4:int = 0;
         var extra:Number = NaN;
         var msg:String = null;
         if(date == null)
         {
            return null;
         }
         part = part.toLowerCase();
         if("yyyy" == part)
         {
            return new Date(date.fullYear + units,date.month,date.date,date.hours,date.minutes,date.seconds,date.milliseconds);
         }
         if("m" == part)
         {
            month = date.month + units;
            year = date.fullYear;
            if(month >= 0)
            {
               y_amount = month / 12;
            }
            else
            {
               y_amount = (month + 1) / 12 - 1;
            }
            if(y_amount != 0)
            {
               year = year + y_amount;
            }
            if(month >= 0)
            {
               month = month % 12;
            }
            else
            {
               month = month % 12;
               if(month < 0)
               {
                  month = month + 12;
               }
            }
            day = date.date;
            if(day > months[month])
            {
               day = months[month];
               if(isLeapYear(year))
               {
                  day = day + 1;
               }
            }
            return new Date(year,month,day,date.hours,date.minutes,date.seconds,date.milliseconds);
         }
         if("d" == part)
         {
            return new Date(date.getTime() + units * MILLISECONDS_PER_DAY);
         }
         if("h" == part)
         {
            return new Date(date.getTime() + units * MILLISECONDS_PER_HOUR);
         }
         if("n" == part)
         {
            return new Date(date.getTime() + units * MILLISECONDS_PER_MINUTE);
         }
         if("s" == part)
         {
            return new Date(date.getTime() + units * 1000);
         }
         if("l" == part)
         {
            return new Date(date.getTime() + units);
         }
         if("w" == part)
         {
            dayOfWeek = date.day;
            if(units >= 0)
            {
               offset = dayOfWeek - MONDAY;
               if(offset >= 5)
               {
                  offset = offset - 7;
               }
            }
            else
            {
               offset = -(FRIDAY - dayOfWeek);
               if(offset <= -5)
               {
                  offset = offset + 7;
               }
            }
            newDate = dateAdd("d",-offset,date);
            if(dayOfWeek == SATURDAY || dayOfWeek == SUNDAY)
            {
               offset = 0;
               if(units > 0)
               {
                  units = units - 1;
               }
               if(units < 0)
               {
                  units = units + 1;
               }
            }
            units = units + offset;
            x1 = units / 5;
            x2 = x1 * 7;
            x3 = units % 5;
            x4 = x2 + x3;
            newDate = dateAdd("d",x4,newDate);
            return newDate;
         }
         if("y" == part)
         {
            extra = units * MILLISECONDS_PER_DAY;
            return new Date(date.getTime() + extra);
         }
         if("q" == part)
         {
            return dateAdd("m",3 * units,date);
         }
         if("ww" == part)
         {
            return new Date(date.getTime() + units * MILLISECONDS_PER_DAY * 7);
         }
         msg = ResourceManager.getInstance().getString("fiber","invalidDatePart1",[part]);
         throw new Error(msg);
      }
      
      public static function dateCompare(date1:Date, date2:Date) : int
      {
         if(date1 == null || date2 == null)
         {
            return 0;
         }
         var t1:Number = date1.getTime();
         var t2:Number = date2.getTime();
         if(t1 < t2)
         {
            return -1;
         }
         if(t1 > t2)
         {
            return 1;
         }
         return 0;
      }
      
      public static function dateDiff(part:String, date1:Date, date2:Date) : Number
      {
         var l1:Number = NaN;
         var l2:Number = NaN;
         var milisbetween:Number = NaN;
         var isNeg:Boolean = false;
         var secsbetween:Number = NaN;
         var minsbetween:Number = NaN;
         var hoursbetween:Number = NaN;
         var daysbetween:Number = NaN;
         var weeksbetween:Number = NaN;
         var monthsbetween:Number = NaN;
         var yearsbetween:Number = NaN;
         var quartersbetween:Number = NaN;
         var msg:String = null;
         if(date1 == null || date2 == null)
         {
            return 0;
         }
         if(dateCompare(date1,date2) == 0)
         {
            return 0;
         }
         l1 = date1.getTime();
         l2 = date2.getTime();
         part = part.toLowerCase();
         if(part != "s" && part != "n" && part != "h")
         {
            l1 = l1 + date1.getTimezoneOffset();
            l2 = l2 + date2.getTimezoneOffset();
         }
         milisbetween = l2 - l1;
         isNeg = milisbetween < 0;
         secsbetween = !!isNeg?Number(Math.ceil(milisbetween / 1000)):Number(Math.floor(milisbetween / 1000));
         minsbetween = !!isNeg?Number(Math.ceil(secsbetween / 60)):Number(Math.floor(secsbetween / 60));
         hoursbetween = !!isNeg?Number(Math.ceil(minsbetween / 60)):Number(Math.floor(minsbetween / 60));
         daysbetween = !!isNeg?Number(Math.ceil(hoursbetween / 24)):Number(Math.floor(hoursbetween / 24));
         weeksbetween = !!isNeg?Number(Math.ceil(daysbetween / 7)):Number(Math.floor(daysbetween / 7));
         monthsbetween = !!isNeg?Number(Math.ceil(MonthDiff(date1,date2))):Number(MonthDiff(date1,date2));
         yearsbetween = !!isNeg?Number(Math.ceil(monthsbetween / 12)):Number(Math.floor(monthsbetween / 12));
         quartersbetween = !!isNeg?Number(Math.ceil(monthsbetween / 3)):Number(Math.floor(monthsbetween / 3));
         if(part == "s")
         {
            return secsbetween;
         }
         if(part == "n")
         {
            return minsbetween;
         }
         if(part == "h")
         {
            return hoursbetween;
         }
         if(part == "d" || part == "y")
         {
            return daysbetween;
         }
         if(part == "ww")
         {
            return weeksbetween;
         }
         if(part == "yyyy")
         {
            return yearsbetween;
         }
         if(part == "m")
         {
            return monthsbetween;
         }
         if(part == "q")
         {
            return quartersbetween;
         }
         if(part == "l")
         {
            return milisbetween;
         }
         msg = ResourceManager.getInstance().getString("fiber","invalidDatePart2",[part]);
         throw new Error(msg);
      }
      
      public static function datePart(part:String, date:Date) : int
      {
         var msg:String = null;
         if(date == null)
         {
            return 0;
         }
         part = part.toLowerCase();
         if("yyyy" == part)
         {
            return date.fullYear;
         }
         if("m" == part)
         {
            return 1 + date.month;
         }
         if("d" == part)
         {
            return date.date;
         }
         if("h" == part)
         {
            return date.hours;
         }
         if("n" == part)
         {
            return date.minutes;
         }
         if("s" == part)
         {
            return date.seconds;
         }
         if("l" == part)
         {
            return date.milliseconds;
         }
         if("w" == part)
         {
            return date.day + 1;
         }
         if("y" == part)
         {
            return dayOfYear(date);
         }
         if("q" == part)
         {
            return 1 + date.month / 3;
         }
         if("ww" == part)
         {
            return weekOfYear(date);
         }
         msg = ResourceManager.getInstance().getString("fiber","invalidDatePart",[part]);
         throw new Error(msg);
      }
      
      public static function datePartUTC(part:String, date:Date) : int
      {
         var msg:String = null;
         if(date == null)
         {
            return 0;
         }
         part = part.toLowerCase();
         if("yyyy" == part)
         {
            return date.fullYearUTC;
         }
         if("m" == part)
         {
            return 1 + date.monthUTC;
         }
         if("d" == part)
         {
            return date.dateUTC;
         }
         if("h" == part)
         {
            return date.hoursUTC;
         }
         if("n" == part)
         {
            return date.minutesUTC;
         }
         if("s" == part)
         {
            return date.secondsUTC;
         }
         if("l" == part)
         {
            return date.millisecondsUTC;
         }
         if("w" == part)
         {
            return date.dayUTC + 1;
         }
         if("y" == part)
         {
            return dayOfYear(date);
         }
         if("q" == part)
         {
            return 1 + date.monthUTC / 3;
         }
         if("ww" == part)
         {
            return weekOfYear(date);
         }
         msg = ResourceManager.getInstance().getString("fiber","invalidDatePart",[part]);
         throw new Error(msg);
      }
      
      public static function getDay(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         return date.date;
      }
      
      public static function getDayUTC(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         return date.dateUTC;
      }
      
      public static function dayOfWeek(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return date.day + 1;
      }
      
      public static function dayOfYear(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return (Date.UTC(date.fullYear,date.month,date.date,0,0,0) - Date.UTC(date.fullYear,0,1,0,0,0)) / 1000 / 60 / 60 / 24 + 1;
      }
      
      public static function daysInMonth(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         var count:int = months[date.month];
         if(date.month == 1 && isLeapYear(date.fullYear))
         {
            count = count + 1;
         }
         return count;
      }
      
      public static function daysInYear(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         if(isLeapYear(date.fullYear))
         {
            return 366;
         }
         return 365;
      }
      
      public static function firstDayOfMonth(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         var firstOfMonth:Date = createDate(date.fullYear,date.month + 1,1,0,0,0);
         return dayOfYear(firstOfMonth);
      }
      
      public static function getHour(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return date.hours;
      }
      
      public static function getHourUTC(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return date.hoursUTC;
      }
      
      public static function isLeapYear(year:int) : Boolean
      {
         var isLeap:Boolean = year % 4 == 0;
         if(isLeap && year >= 1582 && year % 400 != 0 && year % 100 == 0)
         {
            isLeap = false;
         }
         return isLeap;
      }
      
      public static function getMinute(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return date.minutes;
      }
      
      public static function getMinuteUTC(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return date.minutesUTC;
      }
      
      public static function getMonth(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         return date.month + 1;
      }
      
      public static function getMonthUTC(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         return date.monthUTC + 1;
      }
      
      public static function getQuarter(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         return 1 + date.month / 3;
      }
      
      public static function getSecond(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return date.seconds;
      }
      
      public static function getSecondUTC(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return date.secondsUTC;
      }
      
      public static function getMillisecond(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return date.milliseconds;
      }
      
      public static function getMillisecondUTC(date:Date) : int
      {
         if(date == null)
         {
            return -1;
         }
         return date.millisecondsUTC;
      }
      
      public static function weekOfYear(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         var onejan:Date = new Date(date.fullYear,0,1);
         var mydate:Date = new Date(date.fullYear,date.month,date.date);
         return Math.ceil(((mydate.getTime() - onejan.getTime()) / MILLISECONDS_PER_DAY + onejan.day + 1) / 7);
      }
      
      public static function getYear(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         return date.fullYear;
      }
      
      public static function getYearUTC(date:Date) : int
      {
         if(date == null)
         {
            return 0;
         }
         return date.fullYearUTC;
      }
      
      public static function years(endDate:Date, startDate:Date) : int
      {
         if(endDate == null || startDate == null)
         {
            return -1;
         }
         return dateDiff("yyyy",startDate,endDate);
      }
      
      private static function MonthDiff(date1:Date, date2:Date) : Number
      {
         var holder:Date = null;
         var cal3:Date = null;
         if(date1 == null || date2 == null)
         {
            return -1;
         }
         var bSwitched:Boolean = false;
         if(date1 > date2)
         {
            holder = date1;
            date1 = date2;
            date2 = holder;
            bSwitched = true;
         }
         var lMonthDiff:Number = 0;
         var lYearDiff:Number = date2.fullYear - date1.fullYear;
         var year2:int = date2.fullYear;
         var month1:int = date1.month;
         var month2:int = date2.month;
         var day1:int = date1.date;
         var day2:int = date2.date;
         if(lYearDiff > 0)
         {
            if(month1 > month2)
            {
               lYearDiff--;
            }
            lMonthDiff = lMonthDiff + lYearDiff * 12;
         }
         if(month1 > month2)
         {
            lMonthDiff = lMonthDiff + (12 + month2 - month1);
         }
         else
         {
            lMonthDiff = lMonthDiff + (month2 - month1);
         }
         if(day1 > day2 && !isDateEndOfMonth(date2))
         {
            lMonthDiff--;
         }
         else if(isDateEndOfMonth(date1) && !isDateEndOfMonth(date2))
         {
            lMonthDiff--;
         }
         if(day1 == day2)
         {
            cal3 = new Date(year2,month2,day2,date1.hours,date1.minutes,date1.seconds);
            if(cal3 > date2 && lMonthDiff > 0)
            {
               lMonthDiff--;
            }
         }
         return !!bSwitched?Number(-lMonthDiff):Number(lMonthDiff);
      }
      
      private static function isDateEndOfMonth(date:Date) : Boolean
      {
         var x:int = daysInMonth(date);
         return date.date == x;
      }
   }
}
