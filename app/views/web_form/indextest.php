<?php

if(isset($_POST['submit'])) {
    if (isset($_POST['name'], $_POST['email'], $_POST['message']) ) {
        $to="hotaznbuns@gmail.com";
        $name = $_POST['name'];
        $from = $_POST['email'];
        $message = $_POST['message'];
        mail($to, $subject, $message, "From:" .$from);

        echo "Your message has been sent.";
    }
    else { // Invalid submitted values.
        echo '<h1>Error!</h1>
<p class="error">Please properly fill out the form.</p>';
    }}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web_Form</title>
    <link href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow|PT+Sans:400,400i,700" rel="stylesheet">
</head>
<body>
<h1>Contact Me</h1>
<p>Please fill out this form to contact me.</p>
<form action="MAILTO:glazedover.VTSol@gmail.com" method="post" enctype="text/plain">
    <p>Name: <input type = "text" name = "name"/></p>
    <p>Email Address: <input type = "text" name = "email"/></p>
    <p>Message/Comments:<p><textarea rows="5" cols="40" name="message"></textarea></p></p>
    <p><input type="submit" name="submit" value="Send!" /></p></form>
</body>
</html>