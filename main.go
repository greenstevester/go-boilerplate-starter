// main.go
package main

import (
	"fmt"
	"main/debug"
	"main/package_1"
	"main/shared"
)

func main() {
	package_1.Sayhellofrompackage1()
	debug.Enable()
	fmt.Println(shared.GeneratorPrefix)
}
