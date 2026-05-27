<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
    <div class="wraper py-3">

    <form action="/projekt1/Public/index.php" method="POST">
        <div class="row">
            <div class="col">
            <div class="mb-3">
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>  
            </div>
            </div>

            <div class="col">
            <div class="mb-3">
                <input type="text" class="form-control" id="role" name="password" placeholder="Password" required>  
            </div>
            </div>

            <div class="col">
            <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </div>
     </form>
    </div>

<h1>Users list</h1>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Username</th>
      <th scope="col">Role</th>
      <th scope="col">Created_at</th>
      <th scope="col">Action</th>
    </tr>
  </thead>

  <tbody>
    <?php foreach ($users as $user) :?>
        <tr>
            <td><?= $user->getId();?></td>
            <td><?= $user->getUsername();?></td>
            <td><?= $user->getRole();?></td>
            <td><?= $user->getCreatedAt();?></td>

            <td>
              <form action="/projekt1/view/info.php" method="POST">
                <input type="hidden" name="action" value="info">
                <input type="hidden" name="id" value="<?= $user->getId() ?>">
                <button type="submit" class="btn btn-info">Info</button> 
              </form>
            </td>

              <td>
              <form action="#" method="post">
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="id" value="<?= $user->getId() ?>">
              <button type="submit" class="btn btn-warning">Update</button> 
              </form>
              </td>

              <td>
              <form action="#" method="post">
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="id" value="<?= $user->getId() ?>">
              <button type="submit" class="btn btn-danger">Delete</button>
              </form>
              </td>

        </tr>
    <?php endforeach;?>
  </tbody>
</table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
<?php
