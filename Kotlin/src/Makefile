SOURCES = `find . -name "*.kt"`
DIR = build
OUT = out
MAIN = AppKt

all: clean
	-mkdir build
	kotlinc $(SOURCES) -include-runtime -d $(DIR)/$(OUT).jar

clean:
	-rm -rf $(DIR)

run:
	kotlin -classpath $(DIR)/$(OUT).jar $(MAIN) ${ARGS}
