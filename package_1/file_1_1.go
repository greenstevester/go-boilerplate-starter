// file_1_1.go

package package_1

import (
	"fmt"
	"main/shared"
)

func Sayhellofrompackage1() {
	fmt.Println("Hello from " + shared.PackageOneConstant)
}
