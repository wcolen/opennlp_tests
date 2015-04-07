# rm -rf res

mkdir target/res

for i in "1.6.0"
do	
	echo Testing ${i}
	time sh exec.sh ${i} > target/res/allout_${i}.txt 2>&1
done