vers=$1

# mkdir ../res
# mkdir ../res/res_${vers}

time sh bin/opennlp SentenceDetector ../models/en-sent.bin < ../out-documents.test > ../res/res_${vers}/out-sentences.test
 
time sh bin/opennlp TokenizerME ../models/en-token.bin < ../res/res_${vers}/out-sentences.test > ../res/res_${vers}/out-toks.test
 
time sh bin/opennlp TokenNameFinder ../models/en-ner-person.bin < ../res/res_${vers}/out-toks.test > ../res/res_${vers}/out-ner.test
 
time sh bin/opennlp POSTagger ../models/en-pos-maxent.bin < ../res/res_${vers}/out-toks.test > ../res/res_${vers}/out-pos_maxent.test
 
time sh bin/opennlp POSTagger ../models/en-pos-perceptron.bin < ../res/res_${vers}/out-toks.test > ../res/res_${vers}/out-pos_pers.test
 
time sh bin/opennlp ChunkerME ../models/en-chunker.bin < ../res/res_${vers}/out-pos_pers.test > ../res/res_${vers}/out-chk.test
 
time sh bin/opennlp Parser ../models/en-parser-chunking.bin < ../res/res_${vers}/out-toks.test > ../res/res_${vers}/out-parse.test