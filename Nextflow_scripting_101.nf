// // Getting Started with NextFlow scripting // //

// //Hello world

//println "Hello, world!"

// //Variables

/*
x = 1
println x

x = new java.util.Date()
println x

x = -3.1499392
println x

x = false
println x

x = "Hi"
println x

*/

// Lists

/*
myList = [1776, -1, 33, 99, 0, 928734928763]
println myList[0]
println myList.size()
*/

// // Maps (dictionaries)

// scores = [ "Brett":100, "Pete":"Did not finish", "Andrew":86.87934 ]
// //println scores["Pete"]
// // println scores.Pete

// scores["Pete"] = 3
// scores["Cedric"] = 120

// println scores

// // Multiple assignment
// // An array or a list object can used to assign to multiple variables at once:

// (a, b, c) = [10, 20, 'foo']
// assert a == 10 && b == 20 && c == 'foo'

// println c


// // If else

// x = Math.random()
// if( x < 0.5 ) {
//     println "You lost."
// }
// else {
//     println "You won!"
// }

// // Strings

// println "he said 'cheese' once"
// println 'he said "cheese!" again'

// a = "world"
// print "hello " + a + "\n"

// // Difference between " " and ' '
// // " " lets you use variables with $ prefix while ' ' does not

// foxtype = 'quick'
// foxcolor = ['b', 'r', 'o', 'w', 'n']
// println "The $foxtype ${foxcolor.join()} fox"

// x = 'Hello'
// println '$x + $y'

// // Multi line strings

// text = """
//     hello there James
//     how are you today?
//     """

//  println text

//  // In bash/shell scriptsterminating a line in a multi-line string with a \ character 
//  // prevents a a new line character from separating that line from the one that follows:

//  myLongCmdline = """ blastp \
//                 -in $input_query \
//                 -out $output_file \
//                 -db $blast_database \
//                 -html
//                 """

// result = myLongCmdline.execute().text


// square = { it * it }
// println square(9)



















