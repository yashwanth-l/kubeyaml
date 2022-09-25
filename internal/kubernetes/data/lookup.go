package data

import "fmt"

type StaticFiles struct{}

// Swagger is a fairly meh function. It's poorly named and tied to the update-schemas file.
func (s *StaticFiles) Swagger(version string) []byte {
	switch version {
	case "1.18":
		return s.OneEighteen()
	case "1.19":
		return s.OneNinteen()
	case "1.20":
		return s.OneTwenty()
	case "1.21":
		return s.OneTwentyOne()
	case "1.22":
		return s.OneTwentyTwo()
	case "1.23":
		return s.OneTwentyThree()
	case "1.24":
		return s.OneTwentyFour()
	default:
		panic(fmt.Sprintf("unknown version %v", version))
	}
}
