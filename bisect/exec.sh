# rm -rf res

mkdir target
mkdir target/res

for i in "1574820" "1574819" "1574818" "1574544" "1574524" "1574504" "1574498"
do	
	echo Testing ${i}
	# checkout
	svn co https://svn.apache.org/repos/asf/opennlp/trunk/@${i} target/${i}

	# patch
	if [ ${i} -lt 1646489 ]
		then
	       sed -i '' -e "s/String line;/String line; perfMon.start();/g" target/${i}/opennlp-tools/src/main/java/opennlp/tools/cmdline/chunker/ChunkerMETool.java
	fi
	# build
	if [ ${i} -lt 1640799 ]
		then
	       mvn -e -q -f target/${i}/opennlp/pom.xml install -Dmaven.test.skip
	    else
	       mvn -e -q -f target/${i}/pom.xml install -Dmaven.test.skip
	fi
	tar -xzvf target/${i}/opennlp-distr/target/apache-opennlp-1.6.0-SNAPSHOT-bin.tar.gz -C target/${i}

	time sh target/${i}/apache-opennlp-1.6.0-SNAPSHOT/bin/opennlp ChunkerME en-chunker.bin < out-pos_pers.test > target/${i}/${i}

	hash="$(md5 target/${i}/${i})"

	echo $hash >> res.txt
done