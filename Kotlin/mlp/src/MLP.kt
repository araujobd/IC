import weka.classifiers.Evaluation
import weka.classifiers.functions.MultilayerPerceptron
import weka.core.Instances
import java.io.BufferedReader
import java.io.BufferedWriter
import java.io.FileReader
import java.io.FileWriter

fun main(args: Array<String>) {
    //convertCSVToArff("digits/0.csv", "arff/0.arff")
    val reader = BufferedReader(FileReader("arff/0.arff"))
    val data = Instances(reader)
    reader.close()
    data.setClassIndex(data.numAttributes() - 1)

    val mlp = MultilayerPerceptron()
    mlp.hiddenLayers = "1"
    mlp.learningRate = 0.1
    mlp.trainingTime = 2000
    mlp.momentum = 0.2
    mlp.buildClassifier(data)


    val eval = Evaluation(data)
    eval.evaluateModel(mlp, data)
    System.out.println(eval.errorRate())
    System.out.println(eval.toSummaryString())

    val dataPredict = Instances(BufferedReader(FileReader("asdas.csv")))
    dataPredict.setClassIndex(dataPredict.numAttributes()-1)

    val predictedData = Instances(dataPredict)
    for (i in 0..dataPredict.numInstances()-1) {
        var clsLabel = mlp.classifyInstance(dataPredict.instance(i))
        predictedData.instance(i).setClassValue(clsLabel)
    }


    val writer = BufferedWriter(FileWriter("asdasaaaa.csv"))
    writer.write(predictedData.toString())
    writer.newLine()
    writer.flush()
    writer.close()
}