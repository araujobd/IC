
import java.io.File
import java.security.SecureRandom

val randomSequence: Sequence<Double> = generateSequence {
      SecureRandom().nextDouble() * 2 - 1 }

fun generateWeights(size: Int): Array<Double> = randomSequence
              .take(size)
              .toList()
              .toTypedArray()

fun readFromFile(filename: String) = File(filename)
              .readLines()
              .map { it.split(' ')
              .map {it.toInt() }
              .toTypedArray() }
              .toTypedArray()
