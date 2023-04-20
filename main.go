package main

import "os"

func main() {
	err := os.Mkdir("/tmp/.atomicstestbygo", 0755)
	if err != nil {
		return
	}
}
