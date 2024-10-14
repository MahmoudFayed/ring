/*
	Application : Ring Lessons
	Author      : Salwa Abdrabu
*/

/*
	Variables Scopes
		Three Scopes
		(1) Global Scope
		(2) Object Scope 
		(3) Local Scope 
*/
# Conflict between the global variable and local variable 

# The First way to solve this conflict is using the Main Function 

func main 
x= 10   y = 20                 // x,y are Local variables

nSum = x + y
		      
?  sum(5,6)
? nSum 

func sum x,y                   // x,y are Local variables
	nSum = x + y          // nSum is expected to be Local !
	return nSum

