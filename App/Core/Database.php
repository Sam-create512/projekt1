<?php
    namespace App\Core;

    class Database{
        private string $host = "localhost";
        private string $username = "root";
        private string $password = "";
        private string $dbname = "db_users";
        private string $charset = "utf8mb4";

        private $conn;

        public function getConnection(){
            $this->conn = NULL;
            try{
                $this->conn = new PDO("mysql:host={$this->host};dbname={$this->dbname};charset={$this->charset}", $this->username, $this->password);
            } catch (\PDOException $e) {
                echo $e->getMessage();
            }
            return $this->conn;
        }
    }   