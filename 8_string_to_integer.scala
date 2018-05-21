import scala.util._
import scala.util.control._

object Solution {
    def myAtoi(str: String): Int = {
      val loop = new Breaks

      var myString = str.trim()
      if(myString.isEmpty || myString.head.isLetter) 0
      else {
        var number = "0"
        if (myString.startsWith("-") || myString.startsWith("+")){
          number = myString.head + "0"
          myString = myString.tail
        }
        loop.breakable{
          for (each <- myString) {
            if (each.isDigit && Try((number+each).toLong).isSuccess) {
              number += each
            }
            else loop.break
          }
        }
        ((math.pow(2, 31) - 1).min(number.toLong)).max(math.pow(-2, 31)).toInt
      }
    }
}