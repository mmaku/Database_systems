<html lang="pl">
<head>
<title>Laczenie z baza</title>
<meta charset="utf-8" />
</head>
<body bgcolor="#AADD00">
<?php
$uchwyt = pg_connect("host='localhost' port=5432 user=michal password=baza dbname=DB");
if (!$uchwyt) { echo "<p><b>Wystąpił bład podczas łaczenia z bazą!!!</b></p>"; exit(); }
$wynik = pg_query($uchwyt, " INSERT INTO venues(venue, nation) VALUES ('".$_GET['v']."','".$_GET['n']."');");
if (!$wynik) { echo "<p><b>" . pg_last_error($uchwyt) . "</b></p>"; }
if ($_POST['SL'] == 'SL') $wynik = pg_query($uchwyt, " INSERT INTO homologations(venue, discipline) VALUES ('".$_GET['v']."','SL');");
if (!$wynik) { echo "<p><b>" . pg_last_error($uchwyt) . "</b></p>"; exit(); }
if ($_POST['GS'] == 'GS') $wynik = pg_query($uchwyt, " INSERT INTO homologations(venue, discipline) VALUES ('".$_GET['v']."','GS');");
if (!$wynik) { echo "<p><b>" . pg_last_error($uchwyt) . "</b></p>"; exit(); }
if ($_POST['SG'] == 'SG') $wynik = pg_query($uchwyt, " INSERT INTO homologations(venue, discipline) VALUES ('".$_GET['v']."','SG');");
if (!$wynik) { echo "<p><b>" . pg_last_error($uchwyt) . "</b></p>"; exit(); }
if ($_POST['DH'] == 'DH') $wynik = pg_query($uchwyt, " INSERT INTO homologations(venue, discipline) VALUES ('".$_GET['v']."','DH');");
if (!$wynik) { echo "<p><b>" . pg_last_error($uchwyt) . "</b></p>"; exit(); }
if ($_POST['SC'] == 'SC') $wynik = pg_query($uchwyt, " INSERT INTO homologations(venue, discipline) VALUES ('".$_GET['v']."','SC');");
if (!$wynik) { echo "<p><b>" . pg_last_error($uchwyt) . "</b></p>"; exit(); }
$wynik = pg_query($uchwyt, " INSERT INTO k_points(venue, k_point) VALUES ('".$_GET['v']."','".$_GET['k']."');");
if (!$wynik) { echo "<p><b>" . pg_last_error($uchwyt) . "</b></p>"; exit(); }
pg_close($uchwyt);
?>
<a target="baza" href="baza.html"><font size=5 font color=blue>Powrót do strony głównej portalu</font></a>
</body>
</html>