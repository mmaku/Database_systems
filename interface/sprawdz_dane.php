<html lang="pl">
<head>
<meta charset="utf-8" />
<title>Laczenie z baza</title>
</head>
<body bgcolor="#FFCC66">
<?php
$uchwyt = pg_connect("host='localhost' port=5432 user=michal password=baza dbname=DB");
if (!$uchwyt) { echo "<p><b>Wystapil blad podczas laczenia z baza!!!</b></p>"; exit(); }
$wynik = pg_query($uchwyt, "select zaloz_konto('".$_POST['r']."','".$_POST['s']."','".$_POST['t']."');" );
if (!$wynik) { echo "<p><b>" . pg_last_error($uchwyt) . "</b></p>"; }
while ($wiersz = pg_fetch_row($wynik)) {
echo " $wiersz[0] ";
echo "<br />\n";}
pg_close($uchwyt);
?>
<a target="piwko" href="piwko.html"><font size=5 font color=blue>Powrót do strony głównej portalu</font></a>
</body>
</html>
