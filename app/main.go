package main

import (
	"net/http"
	"fmt"
	"log"
)

func HomeRouterHandler(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	fmt.Println("path", r.URL.Path)
	if r.URL.Path == "/" {
		fmt.Fprintf(w, "Success\n")
	}
	if r.URL.Path == "/ping" {
		fmt.Fprintf(w, "OK\n")
	}
}

func main() {
	var port = "9000"
	fmt.Println("Server start on port #" + port + "\n")
	http.HandleFunc("/", HomeRouterHandler)
	err := http.ListenAndServe(":" + port, nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
