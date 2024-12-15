<!DOCTYPE html>
<html lang="en">
<?
    $database_info = include __DIR__."/config/config.php";
    $connection = mysqli_connect($database_info['servername'],
    $database_info['username'],
    $database_info['password'],
    $database_info['database']
  );  
  $sql_rq = "SELECT  * from  club";
  $query = mysqli_query($connection,$sql_rq);
  if(!$connection){
      die("connecion faild".$mysqli_connect_error());
  }
                    mysqli_close($connection);
               ?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>

<body>
    <div class="container">
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">club_name</th>
                    <th scope="col">logo</th>
                </tr>
            </thead>
            <tbody>
                <?
                while ($row = mysqli_fetch_assoc($query)) {
                    echo "<tr>";
                      echo "<th>".$row['id']."</th>";
                      echo "<td><img src='".$row['logo']."' alt='Club Logo' style='width:50px; height:50px;'></td>";
                      echo "<td>".$row['club_name']."</td>";
                      echo "</tr>";
                }
                ?>
            </tbody>
        </table>
    </div>

</body>
</html>
