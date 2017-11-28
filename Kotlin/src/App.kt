fun main(args: Array<String>)
{
  var filename = "digits/8.csv"
  if (args.firstOrNull() != null)
    filename = args[0]

  val matrix = readFromCSVFile("input/${filename}")
  var perceptron = Perceptron(matrix[0].size -1)

  println(perceptron.weights.contentToString())
  perceptron = train(perceptron, matrix)
  val teste = arrayOf(1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1)
   // val teste = arrayOf(1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1)
    val teste8 = arrayOf( 1,
            0, 1, 1, 1, 0,
            1, 0, 0, 0, 1,
            1, 0, 0, 0, 1,
            0, 1, 0, 1, 0,
            1, 0, 0, 0, 1,
            1, 0, 0, 0, 1,
            0, 1, 1, 1, 0)

  printss(teste8)
  println("")

  println(activate(teste8, perceptron))
  println(perceptron.weights.contentToString())
}

fun printss(a: Array<Int>) {
    for (i in 1 until a.size){
        print(" ${a[i]}")
        if (i % 5 == 0)
            println("")
    }
}
