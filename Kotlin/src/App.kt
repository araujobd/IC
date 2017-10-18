fun main(args: Array<String>)
{
  var filename = "digits/1.txt"
  if (args.firstOrNull() != null)
    filename = args[0]

  val matrix = readFromFile("input/${filename}")
  var perceptron = Perceptron(matrix[0].size -1)

  println(perceptron.weights.contentToString())
  perceptron = train(perceptron, matrix)
 val teste = arrayOf(1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1)
    //val teste = arrayOf(1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1)
    printss(teste)
    println("asdas")
  println(activate(teste, perceptron))
  println(perceptron.weights.contentToString())
}

fun printss(a: Array<Int>) {
    for (i in 0..a.size-1){
        if (i % 5 == 0)
            println("")
        print(" ${a[i]}")
    }
/*    for (i in 0..6) {
        for (j in 0..4)
            print(" ${a[i * 5 + j]}")
        println("")
    }*/
}
