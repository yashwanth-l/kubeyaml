package main

import (
	"fmt"
	"html/template"
	"os"

	"github.com/yashwanth-l/kubeyaml/internal/kubernetes"
)

const (
	defaultActiveTab = "1.21"
)

func main() {
	f, err := os.Create("dist/index.html")
	if err != nil {
		panic(err)
	}
	defer f.Close()

	t, err := template.ParseFiles("templates/index.template.html")
	if err != nil {
		panic(err)
	}

	versions := []string{"1.24", "1.23", "1.22", "1.21", "1.20", "1.19", "1.18"}
	validators := make([]validator, len(versions))
	for i, version := range versions {
		resolver, err := kubernetes.NewResolver(version)
		if err != nil {
			fmt.Printf("failed to get a resolver for version %q: %v", version, err)
			os.Exit(1)
		}
		validators[i] = kubernetes.NewValidator(resolver)
	}

	if err := t.Execute(f, indexTemplateData{
		Validators: validators,
		Selected:   defaultActiveTab,
	}); err != nil {
		panic(err)
	}
	fmt.Printf("Generated file: %s\n", "dist/index.html")
}

type validator interface {
	Validate(map[interface{}]interface{}, *kubernetes.Schema) []error
	Resolve(string) (*kubernetes.Schema, error)
	Version() string
}

type indexTemplateData struct {
	Validators []validator
	Selected   string
}
