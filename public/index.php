<?php

require_once __DIR__ ."/../vendor/autoload.php";
session_start();

use App\Core\Database;
use App\Repositories\UserRepository;
use App\Models\User;

$db = new Database();

$pdo = $db->getConnection();

$userRepo = new UserRepository($pdo);

$user = new User("Majo", "cisco", "admin", false);

var_dump($user);
//$userRepo->delete(5);


if($user = $userRepo->findByUsername("Majo")){
    $user->setUsername("Jano");
    $userRepo->update($user);

}

//$user = $userRepo->findByUsername("Fero");  

//var_dump($user);


// $userRepo->save

?>