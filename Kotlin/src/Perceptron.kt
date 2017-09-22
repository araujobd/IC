data class Perceptron(val weights: Array<Double>) {

    constructor(size: Int):this(generateWeights(size))
}

fun activate(inputs: Array<Int>, perceptron: Perceptron): Int {
    val i: Double = perceptron.weights.indices
            .asSequence()
            .map { inputs[it] * perceptron.weights[it]}
            .sum()

    if (i < 1)
        return 0
    return 1
}

fun adjust(perceptron: Perceptron, error: Int, inputs: Array<Int>, learningRate: Float): Perceptron {
    val newWeights: Array<Double> = perceptron.weights.indices .asSequence()
            .map { perceptron.weights[it] + error * inputs[it] * learningRate }
            .toList()
            .toTypedArray()
    return Perceptron(newWeights)
}

fun train(perceptron: Perceptron, matrix: Array<Array<Int>>, learningRate: Float = 0.1f): Perceptron {
    var per = perceptron
    var i = 0

    do {
        val y = activate(matrix[i], per)
        val error = matrix[i].last() - y
        when(error) {
            0 -> i++
            else -> {
                per = adjust(per, error, matrix[i], learningRate)
                i = 0
            }
        }
    } while (i < matrix.size)
    return per
}


fun main(args: Array<String>) {
    val matrix = readFromFile("input/implies.txt")
    var perceptron = Perceptron(matrix[0].size -1)

    println(perceptron.weights.contentToString())

    perceptron = train(perceptron, matrix)

    println(perceptron.weights.contentToString())
}