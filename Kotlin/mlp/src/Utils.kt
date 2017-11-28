import weka.core.Instances
import weka.core.converters.ArffSaver
import weka.core.converters.CSVLoader
import java.io.File

fun convertCSVToArff(input: String, out: String) {
    val loader = CSVLoader()
    loader.setSource(File(input))
    val data: Instances =  loader.dataSet

    val saver = ArffSaver()
    saver.instances = data
    saver.setFile(File(out))
    saver.setDestination(File(out))
    saver.writeBatch()
}