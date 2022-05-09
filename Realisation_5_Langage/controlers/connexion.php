<?php
    include '../utils/bdd_connect.php';
    include '../models/model_user.php';
    include '../vues/vue_connect_create.php';

    if(isset($_POST['login_user']) AND isset($_POST['mdp_user']) AND !empty($_POST['login_user']) AND !empty($_POST['mdp_user'])){
        //récup super globale post
        $mail = $_POST['login_user'];
        $mdp = $_POST['mdp_user'];
        //récup du hash en bdd
        $hash = getUserByMail($bdd, $mail);
        // var_dump($hash);
        if(password_verify($mdp,$hash)){
            echo '<p>Vous êtes connecté</p>';
        }
        //si mauvais mdp
        else{
            echo '<p>mot de passe incorrect</p>';
        }
    }
    else{
        echo '<p>Veuillez remplir le  formulaire</p>';
    }


?>