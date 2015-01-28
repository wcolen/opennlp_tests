# rm -rf res
# mkdir res


#cd apache-opennlp-1.5.2-incubating
#time sh ../exec.sh 1.5.2 > allout.txt 2>&1

for i in "1.5.2-incubating" "1.5.3" "1.6.0"
do	
	cd apache-opennlp-${i}
	time sh ../exec.sh ${i} > ../res/allout_${i}.txt 2>&1
	cd ..
done