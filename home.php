<?php
session_start();
require_once 'components/db_connect.php';


if (isset($_SESSION['adm'])) {
    header("Location: dashboard.php");
    exit;
}

if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: index.php");
    exit;
}


$res = mysqli_query($connect, "SELECT * FROM user WHERE id=" . $_SESSION['user']);
$row = mysqli_fetch_array($res, MYSQLI_ASSOC);



$sql = "SELECT * FROM animal  WHERE status = 'Available'";
$result = mysqli_query($connect, $sql);
$tbody = ''; 
if (mysqli_num_rows($result)   > 0) {
    while ($rowp = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $tbody .= "
    <div class = 'col-lg-4 col-md-6 col-sm-12 p-3' style='height: 800px;'>
      <div> 
        <div class='card' style='width: 18rem;'>
            <img src='" . $rowp['picture'] . "' class='card-img-top' style='height: 250px;' alt='...'>
                <div class='card-body shadow-lg'>
                <h5 class='card-title'>" . $rowp['name'] . "</h5>
                <p class='card-text'><span class = 'fw-bold'>Live : </span>" . $rowp['live'] . "</p>
                <p class='card-text'><span class = 'fw-bold'>Location : </span>" . $rowp['location'] . "</p>
                <p class='card-text'><span class = 'fw-bold'>Status : </span>" . $rowp['status'] . "</p>
                <p class='card-text'><span class = 'fw-bold'>Vaccinated : </span>" . $rowp['vaccinated'] . "</p>
                <p class='card-text'><span class = 'fw-bold'>Description : </span>" . $rowp['dis'] . "</p>
                <p class='card-text'><span class = 'fw-bold'>Breed : </span>" . $rowp['breed'] . "</p>
                <p class='card-text'><span class = 'fw-bold'>Size : </span>" . $rowp['size'] . "</p>
                <p class='card-text'><span class = 'fw-bold'>Age : </span>" . $rowp['age'] . "</p>
                <a href='details.php?id=" . $rowp['id'] . "' class='btn btn-info'>Details</a>
                <a href='adoption.php?id=" . $rowp['id'] . "' class='btn btn-primary'>Adopt Me</a>
            </div>
        </div>
     </div>
    </div>";
    };
} else {
    $tbody =  "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
}


mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title class="d-flex justify-content-center">Welcome - <?php echo $row['first_name']; ?></title>
    <?php require_once 'components/boot.php' ?>
    <style>
    

    @keyframes color {
  0%   { background: #b3b3b3; }
  20%  { background: #d9d9d9; }
  40%  { background: #9fbfdf; }
  60%  { background: #c6d9ec; }
  80%  { background: #c6d9ec; }
  100% { background: #a6a6a6; }
}

body {
  background: #a6a6a6; /* Fallback */
  animation: color 9s infinite linear;
  
} 

    .userImage {
        width: 200px;
        height: 200px;
        justify-content: center;
        margin-left: 60px;
    }

    .hero {

        @import url('https://fonts.googleapis.com/css?family=Source+Code+Pro:200');


    background-image: url('https://static.pexels.com/photos/414171/pexels-photo-414171.jpeg');
  background-size:cover;
        -webkit-animation: slidein 100s;
        animation: slidein 100s;

        -webkit-animation-fill-mode: forwards;
        animation-fill-mode: forwards;

        -webkit-animation-iteration-count: infinite;
        animation-iteration-count: infinite;

        -webkit-animation-direction: alternate;
        animation-direction: alternate;              
}

@-webkit-keyframes slidein {
from {background-position: top; background-size:3000px; }
to {background-position: -100px 0px;background-size:2750px;}
}

@keyframes slidein {
from {background-position: top;background-size:3000px; }
to {background-position: -100px 0px;background-size:2750px;}

}



.center
{
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background: rgba(75, 75, 250, 0.3);
  border-radius: 3px;
}
.center h1{
  text-align:center;
  color:white;
  font-family: 'Source Code Pro', monospace;
  text-transform:uppercase;
}
        /* background-image: linear-gradient(to right, #00b09b, #96c93d); */
        
    

    </style>
</head>

<body>
    <div class="container-fluid m-0 p-0 text-center">
        <div class="hero p-4 mb-3">
            <div class ="row">
                <div class ="col-8">
                    <img class="userImage rounded-circle" style="height: 250px;" src="picture/<?php echo $row['picture']; ?>" alt="<?php echo $row['first_name']; ?>">
                    <h2 class="text-white mt-4"><strong class = "text-dark">&nbsp; Welcome back, 
                        <?php echo $row['first_name'] . " " . $row['last_name']; ?></strong> </h2>
                </div>
                <div class ="col-4">
                    <a href="logout.php?logout" class="btn btn-info">Sign Out</a>
                    <a href="update.php?id=<?php echo $_SESSION['user'] ?>" class="btn btn-primary">Update your profile</a>
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex">
    <div class="col-auto m-4">
    <a href="senior.php?id=<?php echo $_SESSION['user'] ?>" class="btn btn-dark">Sort Age</a>
    </div>
    <div class="dropdown col-auto m-4">
        <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        Sort Vaccinated
        </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="sort.php">All</a></li>
                <li><a class="dropdown-item" href="sort.php?vaccinated=Yes">Vaccinated</a></li>
                <li><a class="dropdown-item" href="sort.php?vaccinated=No">Not Vaccinated</a></li>
            </ul>
        </div>
        <div class="dropdown col-auto m-4">
            <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
            Sort Size
            </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="sort1.php">All Size</a></li>
                    <li><a class="dropdown-item" href="sort1.php?size=small">small</a></li>
                    <li><a class="dropdown-item" href="sort1.php?size=medium">medium</a></li>
                    <li><a class="dropdown-item" href="sort1.php?size=big">large</a></li>
                </ul>
            </div>
        </div>
    <div class="container">
        <p class='h2'>Animal</p>
            <div class="container">
                <div class="row">
                <?= $tbody; ?>
                </div>
            </div>
    </div>
</body>

</html>