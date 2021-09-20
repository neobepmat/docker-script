package main

import (
	"io"
	"net/http"
)

func main() {
	http.ListenAndServe(":8080", http.HandlerFunc(func (w http.ResponseWriter, r *http.Request) {
		io.Copy(w, r.Body)
	}))
}