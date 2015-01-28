echo Creating folders...

mkdir target
mkdir target/downloads
mkdir target/downloads/corpus
mkdir target/dist
mkdir target/models

echo Downloading corpus...

wget -P target/downloads http://corpora.uni-leipzig.de/downloads/eng_news_2010_300K-text.tar.gz

echo Dowload opennlp distributables...

wget -P target/downloads https://archive.apache.org/dist/incubator/opennlp/apache-opennlp-1.5.2-incubating-bin.tar.gz
wget -P target/downloads http://ftp.unicamp.br/pub/apache//opennlp/opennlp-1.5.3/apache-opennlp-1.5.3-bin.tar.gz
wget -P target/downloads http://people.apache.org/~colen/releases/opennlp-1.6.0/rc2/apache-opennlp-1.6.0-bin.tar.gz

echo Untar corpus ...

tar -xzvf target/downloads/eng_news_2010_300K-text.tar.gz -C target/downloads/corpus

echo Untar opennlp distributables...
for f in target/downloads/apache-opennlp*.tar.gz; do tar -xzvf $f -C target/dist; done

echo Download models

wget -P target/models http://opennlp.sourceforge.net/models-1.5/en-chunker.bin
wget -P target/models http://opennlp.sourceforge.net/models-1.5/en-ner-person.bin
wget -P target/models http://opennlp.sourceforge.net/models-1.5/en-parser-chunking.bin
wget -P target/models http://opennlp.sourceforge.net/models-1.5/en-pos-maxent.bin
wget -P target/models http://opennlp.sourceforge.net/models-1.5/en-pos-perceptron.bin
wget -P target/models http://opennlp.sourceforge.net/models-1.5/en-sent.bin
wget -P target/models http://opennlp.sourceforge.net/models-1.5/en-token.bin

# prepare corpus
# Corpus preparation: the following command will create documents from the corpus. Sed is used to remove the language prefix

echo Prepare corpus (leipzig -> docs)
sh target/dist/apache-opennlp-1.5.3/bin/opennlp DoccatConverter leipzig -data target/downloads/corpus/eng_news_2010_300K-sentences.txt -encoding UTF-8 -lang en | sed -E 's/^en[[:space:]]//g' > target/downloads/corpus/out-tokenized-documents.test
 
# Corpus preparation: this forces the detokenization of the documents
 
echo Prepare corpus (docs -> detokenized sentences)
sh target/dist/apache-opennlp-1.5.3/bin/opennlp SentenceDetectorConverter namefinder -data target/downloads/corpus/out-tokenized-documents.test -encoding UTF-8 -detokenizer en-detokenizer.xml > target/downloads/corpus/out-documents.test
 
