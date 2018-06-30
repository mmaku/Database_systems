<html lang="pl">
<head>
<title>Laczenie z baza</title>
<meta charset="utf-8" />
</head>
<body bgcolor="#AADD00">
<?php
if($d == 'JP')
	$sector = 'JP';
	$dyscipline = NULL;
ELSE
	$sector = 'AL';
	$dyscipline = $_GET['d'];
if ($_POST['wc'])
	$world
$uchwyt = pg_connect("host='localhost' port=5432 user=michal password=baza dbname=DB");
if (!$uchwyt) { echo "<p><b>Wystąpił bład podczas łaczenia z bazą!!!</b></p>"; exit(); }
$wynik = pg_query($uchwyt, " INSERT INTO calendar(id_venue,c_date,sector,discipline,id_referee,world_cup)
							VALUES ('".$_GET['v']."','".$_GET['d']."','".$sector."','".$dyscipline."','".$_GET['r']."','".$world."');");
if (!$wynik) { echo "<p><b>" . pg_last_error($uchwyt) . "</b></p>"; }
pg_close($uchwyt);
?>
<a target="baza" href="baza.html"><font size=5 font color=blue>Powrót do strony głównej portalu</font></a>
</body>
</html>