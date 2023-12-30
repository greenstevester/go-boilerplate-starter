// main.go
package main

import (
	"fmt"
	"main/package_1"
	"main/shared"
)

func main() {
	package_1.Sayhellofrompackage1()
	fmt.Println(shared.GeneratorPrefix)
}
