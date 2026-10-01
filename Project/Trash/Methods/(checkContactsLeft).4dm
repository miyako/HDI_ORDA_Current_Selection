//%attributes = {"invisible":true}
C_LONGINT:C283($1; $2; $totalContacts; $contactsToDelete)

$totalContacts:=$1  // Length of the entity selection
$contactsToDelete:=$2  // Number of contacts about to be deleted

If (($totalContacts-$contactsToDelete)<=2)
	ALERT:C41("No more contacts soon ...")
End if 

