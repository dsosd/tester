#!/bin/bash

FAIL_TEST=0
OVERALL_TEST=0

for ITERS in 0 1 5 10 20; do
	echo "Testing "$ITERS"-th generation:"

	PASS_TEST=0
	TOTAL_TEST=0

	for FILENAME in $(find test_cases/ -type f -regex ".*[0-9]"); do
		source ./check_answer.sh $ITERS $FILENAME

		if [ $? -eq 0 ]; then
			((++PASS_TEST))
		fi
		((++TOTAL_TEST))
	done

	echo $PASS_TEST"/"$TOTAL_TEST
	((OVERALL_TEST += TOTAL_TEST))
	((FAIL_TEST += TOTAL_TEST - PASS_TEST))
done

echo $FAIL_TEST" out of "$OVERALL_TEST" tests failed"
