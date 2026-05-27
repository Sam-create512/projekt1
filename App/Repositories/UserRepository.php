<?php
    namespace App\Repositories;

    use PDO;
    use PDOException;
    use App\Models\User;

    class UserRepository{ // praca s databazou - CRUD 
        private PDO $db;
        
        public function __construct(PDO $pdo)
        {
            $this->db = $pdo;
        }

        public function findByUsername(string $username) :?User // navratova hodnota NULL alebo User
        {
            try{
                $user = NULL;

                $sql = "SELECT * FROM users WHERE username = :username LIMIT 1";  // :username - sql injection ochrana
                $stmt = $this->db->prepare($sql);

                $stmt->execute([":username" => $username]);

                if($row = $stmt->fetch()){
                    $user = new User($row["username"], $row["password"], $row["role"], true);
                    $user->setId((int) $row["id"]);
                    $user->setCreatedAt((string) $row["created_at"]);
                    return $user;   
                } 
                return null;
            }

            catch(PDOException $e){
                return null;
            }
 
        }


        public function findById(int $id) :?User // navratova hodnota NULL alebo User
        {
            try{
                $user = NULL;

                $sql = "SELECT * FROM users WHERE id = :id LIMIT 1";  
                $stmt = $this->db->prepare($sql);

                $stmt->execute([":id" => $id]);

                if($row = $stmt->fetch()){
                    $user = new User($row["username"], $row["password"], $row["role"], true);
                    $user->setId((int) $row["id"]);
                    $user->setCreatedAt((string) $row["created_at"]);
                    return $user;   
                } 
                return null;
            }

            catch(PDOException $e){
                return null;
            }
 
        }


        public function save(User $user) :bool
        {
            try{
                $sql = "INSERT INTO users (username, password, role) VALUES (:username, :password, :role)";
                $stmt = $this->db->prepare($sql);

                $result = $stmt->execute([
                    ":username" => $user->getUsername(),
                    ":password" => $user->getPassword(),
                    "role" => $user->getRole()]);

                if($result){
                    $user->setId((int) $this->db->lastInsertId());
                }
                
                return $result;                
            }
            catch(PDOException $e){
                return false;
            }

        }

        public function update(User $user) :bool
        {
            try{
                $sql = "UPDATE users SET username = :username, password = :password, role = :role, created_at = :created_at WHERE id = :id";
                $stmt = $this->db->prepare($sql);
                $result = $stmt->execute([
                    ":username" => $user->getUsername(),
                    ":password" => $user->getPassword(),
                    ":role" => $user->getRole(),
                    ":id" => $user->getId(),
                    ":created_at" => $user->getCreatedAt()
                ]);
                return $result;
            }
            catch(PDOException $e){
                return false;
            }
        }

        public function delete(int $id) :bool
        {
            try{
                $sql = "DELETE FROM users WHERE id = :id";
                $stmt = $this->db->prepare($sql);

                $result = $stmt->execute([
                    "id" => $id
                ]);
                return $result;
            }
            catch(PDOException $e){
                return false;
            }

        }
        public function findAll() :array {
            try{
                $uzivatelia = [];
    
                $sql = "SELECT * FROM users";
    
                $stmt = $this->db->prepare($sql);
    
                $result = $stmt->execute();
                   
    
                while ($row = $stmt->fetch()) {
                    $user = new User(
                    $row ["username"],
                    $row ["password"],
                    $row ["role"],
                    true);
                    
                
                    $user->setId((int)$row["id"]);
                    $user->setCreatedAt($row["created_at"]);
                    $uzivatelia[] = $user;
                };
                
                return $uzivatelia;
                   
                }
                catch(PDOException $e){
                    return null;
                }
        }
    }