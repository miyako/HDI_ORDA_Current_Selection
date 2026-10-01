//%attributes = {"invisible":true}
FakeData_ArraysInit

C_LONGINT:C283($nbToCreate)
C_OBJECT:C1216($templatePupil)

$nbToCreate:=12  // We create 12 pupils

$templatePupil:=New object:C1471
$templatePupil.firstName:="firstname"
$templatePupil.lastName:="lastname"

ds:C1482.Pupil.all().drop()


For ($i; 1; $nbToCreate)
	
	$pupil:=ds:C1482.Pupil.new()
	$pupil.food:=New object:C1471
	
	FakeData_FillObjectTemplate($templatePupil; $pupil)
	
	If ($i<4)
		$pupil.food.meat:="Yes"
		$pupil.food.fish:="Yes"
		$pupil.food.vegetables:="No"
	End if 
	If (($i>=4) & ($i<7))
		$pupil.food.meat:="Yes"
		$pupil.food.fish:="No"
		$pupil.food.vegetables:="No"
	End if 
	If (($i>=7) & ($i<=9))
		$pupil.food.meat:="No"
		$pupil.food.fish:="Yes"
		$pupil.food.vegetables:="No"
	End if 
	If (($i>=10) & ($i<=12))
		$pupil.food.meat:="No"
		$pupil.food.fish:="No"
		$pupil.food.vegetables:="Yes"
	End if 
	
	$saveStatus:=$pupil.save()
	
End for 

FakeData_ArraysDeinit