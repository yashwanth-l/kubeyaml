package data

import "fmt"

type StaticFiles struct{}

// Swagger is a fairly meh function. It's poorly named and tied to the update-schemas file.
func (s *StaticFiles) Swagger(version string) []byte {
	switch version {
	case "1.13":
		return s.OneThirteen()
	case "1.14":
		return s.OneFourteen()
	case "1.15":
		return s.OneFifteen()
	case "1.16":
		return s.OneSixteen()
	case "1.17":
		return s.OneSeventeen()
	default:
		panic(fmt.Sprintf("unknown version %v", version))
	}
}
