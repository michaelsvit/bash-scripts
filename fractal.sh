#!/bin/bash
main() {
for ((i = 0; i < n; i++))
do
	printY $i
done
}

printY() {
	pows=0
	for ((j = 4; j > 4-$1; j--))
	do
		((pows += 2**j))
	done
	for ((j = 2**(4-$1); j > 0; j--))
	do
		printf '%s' $(printf '_%.0s' $(seq $((50-pows-1))))
		printf '1'
		chunk=$(printf '_%.0s' $(seq $((2**(6-$1)-1))); printf '1')
		for ((k = 1; k < 2**$1; k++))
		do
			printf '%s' $chunk
		done
		printf '%s' $(printf '_%.0s' $(seq $((50-pows))))
		echo
	done
	((pows += 2**(4-$1)))
	for ((j = 1; j <= 2**(4-$1); j++))
	do
		printf '%s' $(printf '_%.0s' $(seq $((50-pows-1)))) 
		sideCount=$(((2**(4-$1))-j))
		side=$(printf '_%.0s' $(seq $sideCount))
		for ((k = 0; k < 2**$1; k++))
		do
			[ $sideCount -gt 0 ] && printf '%s' $side
			printf '1'
			printf '_%.0s' $(seq $((1+2*(j-1)))) 
			printf '1'
			[ $sideCount -gt 0 ] && printf '%s' $side
			if [ $k -lt $((2**$1 - 1)) ]
			then
				chunk=$(printf '_%.0s' $(seq $((2**(5-$1)-1))))
				printf '%s' $chunk
			fi
		done
		printf '%s' $(printf '_%.0s' $(seq $((50-pows))))
		echo
	done
}
read n
pows=0
for ((i = 4; i > 4-$n; i--))
do
	((pows += 2**i))
done
for ((i = 0; i < 63-pows*2; i++))
do
	printf '_%.0s' $(seq 100)
	echo
done
result=$(main)
echo "$result" | tac
