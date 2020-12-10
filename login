<?php
$username=$_POST['username'];
$password=$_POST['password'];
$conn = new mysqli("localhost", "root","","youtuber");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
$SELECT="Select fname, lname, username, gender, youtubers from youtuber where username='$username' AND password='$password'";

$output = $conn->query($SELECT);

if ($output->num_rows > 0) {
  // output data of each row
  while($row = $output->fetch_assoc()) {
    //echo "Welcome " . $row["fname"]." ".$row["lname"];
    echo "<html>
    <head>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <style>
        button {
          background-color: #4CAF50;
          color: white;
          padding: 14px 20px;
          margin: 8px 0;
          border: none;
          cursor: pointer;
          width: 50%;
      }
            img.a {
  border-radius: 50%;
}
            .main {
            width: 68%;
            padding :16px;
            border: 2px solid gray;
            margin-left: 0%;
            margin-top: 0;
        }
        .column {
    float: left;
    }

        .left{
              width: 20%;
            border: 2px solid gray;
            height: 500px;
        }
        .right{
            width: 50%;
            border: 2px solid gray;
            height: 500px;
        }
        p{
            padding-left: 7%;
        }
        </style>
    </head>
    <body>
        <div class='main'>
            <div>
            <center><h1>Youtuber &nbsp;<img src='Connect.png'>&nbsp;Connect</h1></center>
            </div>
        </div>
        <div class='row'>
       
            <div class='column left'>
                <center>
                <img src='profile.png' clas='a' alt='Profile Picture'alt='Avatar' '/>
                <p style='padding: top 30px;'><a href='main.html'> <button type='button'>Logout</button></a></p>
                <p style='padding: top 30px;'><a href='#'> <button type='button'>Account</button></a></p>
            </center>
            </div>
            <div class='column right'>
                <br>
                <p style='display: block; font-size: larger; margin-left:30px ; '> 
                
                First Name :{$row['fname']}<br><br>
                Last Name :{$row['lname']}<br><br>
                Username :{$row['username']}<br><br>
                Gender :{$row['gender']}<br><br>
                Types of Youtuber :{$row['youtubers']}<br><br>
                

          
               
                </p>

            </div>
        </div>
        </div>
    </body>
</html>";
    
  }
} else {
  echo "<p style='padding:50px'><Center><h2>Bad Username or Password!</h2></center></p>";
}
$conn->close();
?>
