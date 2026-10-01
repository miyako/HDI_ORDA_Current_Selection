//%attributes = {}


//Business logic related to the DataStore

Case of 
	: (_TabTitles=2)
		Form:C1466.pupils:=ds:C1482.Pupil.all()
		REDUCE SELECTION:C351([Pupil:3]; 0)
		
		_languages{0}:="Select a language"
		_languages:=0
		
		
	: (_TabTitles=3)
		Form:C1466.pupils:=ds:C1482.Pupil.newSelection()
		ALL RECORDS:C47([Pupil:3])
		
		_languages{0}:="Select a language"
		_languages:=0
		
End case 

btnTrace:=False:C215
