<?php

require_once __DIR__ ."/../vendor/autoload.php";
session_start();

use App\Core\Database;
use App\Repositories\UserRepository;
use App\Models\User;

$db = new Database();

$pdo = $db->getConnection();

$userRepo = new UserRepository($pdo);

//$user = new User("Majo", "cisco", "admin", false);

//var_dump($user);
//$userRepo->delete(5);


//if($user = $userRepo->findByUsername("Majo")){
    //$user->setUsername("Jano");
    //$userRepo->update($user);

//}

//$user = $userRepo->findByUsername("Fero");  

//var_dump($user);


// $userRepo->save
    $users = $userRepo->findAll();

    if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["action"]) && $_POST["action"] === "delete"){

        $userRepo->delete($_POST["id"]);

        header("Location: index.php");
        exit();
    }
    if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["username"]) && isset($_POST["password"])){
        $user = new User($_POST["username"], $_POST["password"]);

        $userRepo->save($user);
        
        header("Location: index.php");
        exit();
    }

    include __DIR__."/../view/home.php";
?>