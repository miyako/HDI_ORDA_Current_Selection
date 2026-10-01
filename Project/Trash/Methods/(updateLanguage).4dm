//%attributes = {"invisible":true}

$es:=ds:C1482.Pupil.query("language=:1"; "Deutsh")

For each ($e; $es)
	$e.language:="German"
	$status:=$e.save()
	
End for each 