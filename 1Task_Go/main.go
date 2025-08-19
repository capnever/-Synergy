package main

import (
	"fmt"
	"math"
	"os"
	"strconv"
)

func main() {
	result, err := computeSumBetweenMaxAndMin(os.Args)
	if err != nil {
		panic(err)
	}
	fmt.Println(result)
}

func computeSumBetweenMaxAndMin(args []string) (int, error) {
	var max = math.MinInt64
	var min = math.MaxInt64

	array := make([]int, 0, 10)
	minIndex := 0
	maxIndex := 0

	for i := 1; i < len(args); i++ {
		number, err := strconv.Atoi(args[i])
		if err != nil {
			return 0, err
		}
		if number < min {
			min = number
			minIndex = i - 1
		}
		if number > max {
			max = number
			maxIndex = i - 1
		}
		array = append(array, number)
	}

	result := 0

	if maxIndex < minIndex {
		maxIndex, minIndex = minIndex, maxIndex
	}
	for i := minIndex + 1; i < maxIndex; i++ {
		if array[i] < 0 {
			result += array[i]
		}
	}

	return result, nil
}
