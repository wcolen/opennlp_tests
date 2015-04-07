vers=$1

mkdir target/res/res_${vers}

component="Name Finder"
corpus="01. Name Finder/CONLL 2002 Dutch Person ned.testa"
path="http://www.cnts.ua.ac.be/conll2002/ner/data/ned.testa"



# time sh target/dist/apache-opennlp-${vers}/bin/opennlp SentenceDetector target/models/en-sent.bin < target/downloads/corpus/out-documents.test > target/res/res_${vers}/out-sentences.test
 
# time sh target/dist/apache-opennlp-${vers}/bin/opennlp TokenizerME target/models/en-token.bin < target/res/res_${vers}/out-sentences.test > target/res/res_${vers}/out-toks.test
 
# time sh target/dist/apache-opennlp-${vers}/bin/opennlp TokenNameFinder target/models/en-ner-person.bin < target/res/res_${vers}/out-toks.test > target/res/res_${vers}/out-ner.test
 
# time sh target/dist/apache-opennlp-${vers}/bin/opennlp POSTagger target/models/en-pos-maxent.bin < target/res/res_${vers}/out-toks.test > target/res/res_${vers}/out-pos_maxent.test
 
# time sh target/dist/apache-opennlp-${vers}/bin/opennlp POSTagger target/models/en-pos-perceptron.bin < target/res/res_${vers}/out-toks.test > target/res/res_${vers}/out-pos_pers.test
 
time sh target/dist/apache-opennlp-${vers}/bin/opennlp ChunkerME target/models/en-chunker.bin < target/res/res_${vers}/out-pos_pers.test > target/res/res_${vers}/out-chk.test
 
# time sh target/dist/apache-opennlp-${vers}/bin/opennlp Parser target/models/en-parser-chunking.bin < target/res/res_${vers}/out-toks.test > target/res/res_${vers}/out-parse.test