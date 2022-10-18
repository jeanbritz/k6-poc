package calc

import (
	"errors"
	"go.k6.io/k6/js/modules"
)

func init() {
	modules.Register("k6/x/calc", new(Calc))
}

type Calc struct {
}

func (c *Calc) Add(x int, y int) int {
	return x + y
}

func (c *Calc) Subtract(x int, y int) int {
	return x - y
}

func (c *Calc) Multiply(x int, y int) int {
	return x * y
}

func (c *Calc) Divide(x int, y int) (int, error) {
	if y == 0 {
		return 0, errors.New("cannot divide by zero")
	}
	return x / y, nil
}
