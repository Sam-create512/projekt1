<?php
    namespace App\UserRepository;
    class UserRepository{
        private string $name = "Sano";

        public function test(){
            return $this->name;
        }
    }