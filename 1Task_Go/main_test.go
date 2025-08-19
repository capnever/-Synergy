package main

import (
	"fmt"
	"testing"
)

func TestComputeSumBetweenMaxAndMin(t *testing.T) {
	tests := []struct {
		args    []string
		want    int
		wantErr bool
	}{
		{
			args: []string{"program", "0", "5", "3", "2", "1", "4", "6", "8", "7", "9"}, // ok
			want: 0,
		},
		{
			args: []string{"program", "9", "8", "1", "4", "3", "7", "2", "6", "5", "0"}, // -9
			want: 0,
		},
		{
			args: []string{"program", "1", "2", "0", "7", "6", "5", "9", "8", "4", "3"},
			want: 0,
		},
		{
			args: []string{"program", "5", "4", "9", "1", "2", "3", "0", "6", "7", "8"},
			want: 0,
		},
		{
			args: []string{"program", "1", "2", "8", "9", "3", "4", "5", "6", "7", "0"},
			want: 0,
		},
		{
			args: []string{"program", "9", "1", "2", "3", "4", "0", "8", "7", "6", "5"},
			want: 0,
		},
		{
			args: []string{"program", "0", "1", "6", "7", "9", "8", "4", "5", "3", "2"},
			want: 0,
		},
		{
			args: []string{"program", "1", "2", "9"},
			want: 0,
		},
		{
			args: []string{"program", "-5", "-2", "9"},
			want: -2,
		},
		{
			args: []string{"program", "-5", "-2", "-1", "0", "3"},
			want: -3,
		},
		{
			args: []string{"program", "-5", "-2", "1", "2", "-1", "0", "3"},
			want: -3,
		},
		{
			args:    []string{"program", "a", "b", "c"},
			wantErr: true, // Invalid input
		},
	}

	var count = 0
	for _, tt := range tests {

		t.Run("", func(t *testing.T) {
			got, err := computeSumBetweenMaxAndMin(tt.args)
			if (err != nil) != tt.wantErr {
				t.Errorf("computeSumBetweenMaxAndMin() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if got != tt.want {
				t.Errorf("computeSumBetweenMaxAndMin() = %v, want %v", got, tt.want)
			} else {
				fmt.Println(" got:", got, " :: OK", "params:", tt.args)
				count++
			}
		})
	}
	fmt.Printf("Total tests = %v, test passed = %v \n", len(tests), count)
}
