func main
	x=1000
	? x
	test()
	? x
	try
		? y
		? z
	catch
		? "pass error"
	done

func test
	new point {
		x=10 y=20 z=30 
		? self
		return
	}

class point x y z

class myclass
	value =100
	func mymethod
		? value
		test()
		? value
		