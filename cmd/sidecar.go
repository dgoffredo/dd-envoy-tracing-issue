package main

import (
	"errors"
	"fmt"
	"log"
	"net/http"
)

func run() error {
	m := http.NewServeMux()
	m.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		log.Println("handling request")
		writer.WriteHeader(http.StatusOK)
	})

	if err := http.ListenAndServe(":8080", m); !errors.Is(err, http.ErrServerClosed) {
		return fmt.Errorf("starting http server: %w", err)
	}

	return nil
}

func main() {
	log.Println("starting sidecar")
	if err := run(); err != nil {
		log.Fatal(err)
	}
}
