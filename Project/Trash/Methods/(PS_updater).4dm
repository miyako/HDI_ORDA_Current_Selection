//%attributes = {"invisible":true}
C_LONGINT:C283($1)  // primary key of the entity to update
C_LONGINT:C283($2)  // if NOT passed create the process
C_LONGINT:C283($ps)
C_OBJECT:C1216($status; contactToUpdate)



If (Count parameters:C259=1)
	
	$ps:=New process:C317(Current method name:C684; 0; Current method name:C684; $1; 0; *)
	
Else 
	
	contactToUpdate:=ds:C1482.Contact.get($1)
	contactToUpdate.lastName:="LAST NAME UPDATED!"
	$status:=contactToUpdate.save(0)  // This update causes the stamp to change
	
End if 