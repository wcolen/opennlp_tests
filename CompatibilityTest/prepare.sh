mkdir downloads
cd downloads

# download corpus
wget http://corpora.uni-leipzig.de/downloads/eng_news_2010_300K-text.tar.gz

# dowload opennlp
wget https://archive.apache.org/dist/incubator/opennlp/apache-opennlp-1.5.2-incubating-bin.tar.gz
wget http://ftp.unicamp.br/pub/apache//opennlp/opennlp-1.5.3/apache-opennlp-1.5.3-bin.tar.gz
wget http://people.apache.org/~colen/releases/opennlp-1.6.0/rc2/apache-opennlp-1.6.0-bin.tar.gz


mkdir corpus
tar -xzvf eng_news_2010_300K-text.tar.gz -C corpus

for f in apache-opennlp*.tar.gz; do tar -xzvf $f -C ..; done

#download models

cd ..
mkdir models
wget http://opennlp.sourceforge.net/models-1.5/en-chunker.bin
wget http://opennlp.sourceforge.net/models-1.5/en-ner-person.bin
wget http://opennlp.sourceforge.net/models-1.5/en-parser-chunking.bin
wget http://opennlp.sourceforge.net/models-1.5/en-pos-maxent.bin
wget http://opennlp.sourceforge.net/models-1.5/en-pos-perceptron.bin
wget http://opennlp.sourceforge.net/models-1.5/en-sent.bin
wget http://opennlp.sourceforge.net/models-1.5/en-token.bin

cd ..

# prepare corpus
# Corpus preparation: the following command will create documents from the corpus. Sed is used to remove the language prefix
 
sh apache-opennlp-1.5.3/bin/opennlp DoccatConverter leipzig -data downloads/corpus/eng_news_2010_300K-sentences.txt -encoding UTF-8 -lang en | sed -E 's/^en[[:space:]]//g' > out-tokenized-documents.test
 
# Corpus preparation: this forces the detokenization of the documents
 
sh apache-opennlp-1.5.3/bin/opennlp SentenceDetectorConverter namefinder -data out-tokenized-documents.test -encoding UTF-8 -detokenizer en-detokenizer.xml > out-documents.test
 
