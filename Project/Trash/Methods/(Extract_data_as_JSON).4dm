//%attributes = {"invisible":true}


C_COLLECTION:C1488($collection)

$contactsColl:=ds:C1482.Contact.all().toCollection("firstName, lastName, addressID")

$addressColl:=ds:C1482.Address.all().toCollection("ID, zipCode, state, street,")

$txtContacts:=JSON Stringify:C1217($contactsColl; *)
$txtAddresses:=JSON Stringify:C1217($addressColl; *)


TEXT TO DOCUMENT:C1237(Get 4D folder:C485(Current resources folder:K5:16)+"contacts_data.json"; $txtContacts)
TEXT TO DOCUMENT:C1237(Get 4D folder:C485(Current resources folder:K5:16)+"addresses_data.json"; $txtAddresses)




