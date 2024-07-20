package main

import (
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"log"
	"net/http"
)

func main() {
	r := chi.NewRouter()
	r.Use(middleware.Logger)

	// Serve static files
	fs := http.FileServer(http.Dir("./static"))
	r.Handle("/*", fs)

	log.Println("Starting server on :3000")
	if err := http.ListenAndServe(":3000", r); err != nil {
		log.Fatalf("Could not start server: %s\n", err)
	}
}
