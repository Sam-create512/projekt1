<?php

namespace App\Controllers;

use App\Models\User;
use App\Repositories\UserRepository;


class UserController
{
    private UserRepository $userRepo;
    
    public function __construct(UserRepository $userRepo)
    {
        $this->userRepo = $userRepo;
    }

    public function index()
    {
        include __DIR__ . "/../../view/home.php";
    }

    public function login()
    {
        if($_SERVER["REQUEST_METHOD"] === "POST"){
            $username = trim($_POST["username"] ?? "");  //?? skontroluje ci POST existuje a nie je null, ak neexistuje prida NULL a zabrani chybe 
            $password = trim($_POST["password"] ?? "");

            $user = $this->userRepo->findByUsername($username);

            if(!$user || !$user->passwordVerify($password)){
                $_SESSION["flash_error"] = "Nesprávne meno alebo heslo!";
                header("Location:/projekt1/Public/login");
                exit();
            }

            $_SESSION["user_id"] = $user->getId();
            $_SESSION["username"] = $user->getUsername();
            $_SESSION["role"] = $user->getRole();

            if($user->getRole() === "admin"){
                header("Location:/projekt/public/admin");    
            }else{
                header("Location:/projekt1/public/dashboard");
            }

            exit();

        }
        include __DIR__ . "/../../view/login.php";
    }

    public function register()
    {
        if($_SERVER["REQUEST_METHOD"] === "POST"){
            $username = trim($_POST["username"] ?? "");  //?? skontroluje ci POST existuje a nie je null, ak neexistuje prida NULL a zabrani chybe 
            $password = trim($_POST["password"] ?? "");
            
            if($this->userRepo->findByUsername($username)){
                $_SESSION["flash_error"] = "Uživateľ už existuje!";
                header("Location:/projekt1/Public/register");        
                exit();
            }

            if(mb_strlen($username) < 3 || mb_strlen($password) < 6){
                $_SESSION["flash_error"] = "Uživateľské meno musí mať viac ako 3 znaky a heslo viac ako 6 znakov";
                header("Location:/projekt1/Public/register");        
                exit();                
            }

            $newUser = new User($username, $password);

            if($this->userRepo->save($newUser))
            {
                $_SESSION["flash_success"] = "Registrácia úspešná!";
                header("Location:/projekt1/Public/login");
            }

        
        }  
        include __DIR__ . "/../../view/register.php";
    }

    public function logout() :void 
    {
        session_destroy();
        header("Location:/projekt1/public/");
        exit(); 
    }
}
?>