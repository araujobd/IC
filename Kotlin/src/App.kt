fun main(args: Array<String>)
{
  var filename = "or.txt"
  if (args.firstOrNull() != null)
    filename = args[0]

  val matrix = readFromFile("input/${filename}")
  var perceptron = Perceptron(matrix[0].size -1)

  println(perceptron.weights.contentToString())
  perceptron = train(perceptron, matrix)
  println(perceptron.weights.contentToString())
}

