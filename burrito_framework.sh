
#!/bin/bash

#declare variables for manipulation use
new="create_project";
entity="new_entity";
module="new_module";
object="new_object";

#creation of a new project
if [ $1 = $new ]
then
        echo 'Creation of a new project'
        echo 'Give a name to your project :'
        name_project=$2
        echo 'Creation of a new project called' $name_project
                mkdir $name_project
                mkdir $name_project/erreurs
                mkdir $name_project/admin
		touch $name_project/index.php
		touch $name_project/mapping.php
		touch $name_project/.htaccess
		touch $name_project/erreurs/404.php
		mkdir $name_project/build_in
		mkdir $name_project/build_in/form
		mkdir $name_project/build_in/static/
		mkdir $name_project/build_in/static/img
		mkdir $name_project/build_in/static/style
		mkdir $name_project/build_in/static/js
		mkdir $name_project/build_in/static/required
		mkdir $name_project/build_in/static/form
		mkdir $name_project/build_in/entity
		touch $name_project/build_in/entity/database.sql
		touch $name_project/build_in/functions.php
		touch $name_project/build_in/form/upload.php
		touch $name_project/build_in/form/uploadSuite.php
		touch $name_project/build_in/form/form.php
		touch $name_project/build_in/mail.php
		touch $name_project/build_in/cookies.php
		touch $name_project/build_in/connection.php
		touch $name_project/build_in/static/required/header.php
		touch $name_project/build_in/static/required/nav.php
		touch $name_project/build_in/static/required/footer.php

		echo "<?php
    session_start();
        ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='fr' />
        <link rel='icon' type='image/ico' href='https://www.w3schools.com/images/w3schools_green.jpg' />
        <link rel='stylesheet' href='style.css' />
        <title>index</title>
    </head>
    <body>
        <div id='bloc_page'>
            <header>
			<a href='https://github.com/you'><img style='position: absolute; top: 0; right: 0; border: 0;' src='https://github.com/elBichon/burrito_framework' alt='Fork me on GitHub' data-canonical-src='https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png'></a>
			<?php "'$titre_principal'" = 'titre principal du module';	
			      "'$titre2'" = 'titre secondaire du module';
			 ?>
			<?php require('./build_in/connection.php'); ?>
			<?php require('build_in/static/required/header.php'); ?>
                </div>           
                <nav>
			<?php require('build_in/static/required/nav.php'); ?>
                </nav>
            </header>
            <section>
		<img if='logo' src='https://www.w3schools.com/images/w3schools_green.jpg' alt='logo'> 
		<div id='article'>
			<p>Hello World</p></br>
			<p>It is very nice to meet you, it is time to have fun</p>
		</div>
	    </section>
            <footer>
			<?php require('build_in/static/required/footer.php'); ?>
            </footer>
        </div>
    </body>
</html>
" >> $name_project/index.php
		name_table="$name_project""$sql"
		echo "/*script de creation de la bdd*/
create database if not exists "$name_project" character set utf8 collate utf8_unicode_ci;
use "$name_project";
grant all privileges on "$name_project".* to '"$name_project"_user'@'localhost' identified by 'secret';
" >> $name_project/build_in/entity/database.sql
		echo "
ErrorDocument 404 http://localhost/"$name_project"/erreurs/404.php
" >> $name_project/.htaccess
		echo "
<?php
	echo 'erreur 404';
?>
" >> $name_project/erreurs/404.php
	echo "
<div id='titre_principal'>
	<h1><?php echo "'$titre_principal'" ?></h1>    
		<h2><?php echo "'$titre2'" ?></h2>
</div>
" >> $name_project/build_in/static/required/header.php
	echo " 
<ul>
	<li><a href='#'>Liens</a></li>
</ul>
" >> $name_project/build_in/static/required/nav.php
	echo "<p>Proudly created with: Pink Hippo</p>
  <p>Contact information: <a href="mailto:someone@example.com">
  someone@example.com</a>.</p>
" >> $name_project/build_in/static/required/footer.php
	echo "<?php
    try
    {
        "'$bdd'" = new PDO('mysql:host=localhost;dbname=$name_project;charset=utf8', 'root', '');
    }
    catch (Exception "'$e'")
    {
        die('Erreur : ' . "'$e'"->getMessage());
    }
    ?>

" >> $name_project/build_in/connection.php
	echo "<form action='uploadSuite.php' method='post' enctype='multipart/form-data'>
    <p>
        Formulaire d'envoi de fichier :<br />
        <input type='file' name='monfichier' /><br />
        <input type='submit' value='Envoyer le fichier' />
    </p>
</form>
" >> $name_project/build_in/static/form/upload.php
	echo "
<?php
    if (isset("'$_FILES'"['monfichier']) AND "'$_FILES'"['monfichier']['error'] == 0)
    {
        //verification de la taille
        if ("'$_FILES'"['monfichier']['size'] <= 1000000)
        {
            "'$infosfichier'" = pathinfo("'$_FILES'"['monfichier']['name']);
            "'$extension_upload'" = "'$infosfichier'"['extension'];
            "'$extensions_autorisees'" = array('png');   
            if (in_array("'$extension_upload'", "'$extensions_autorisees'"))
            {
                move_uploaded_file("'$_FILES'"['monfichier']['tmp_name'], 'uploads/' . basename("'$_FILES'"['monfichier']['name']));
                echo 'L envoi a bien été effectué !';
            }
        }
    }
    ?>
" >> $name_project/build_in/static/form/uploadSuite.php
		echo '<?php
    function code($texte){
                $texte = str_replace(":D ", "<img src="./images/bbcode/smileys/heureux.png" title="heureux" alt="heureux" />", $texte);
                $texte = str_replace(":lol: ", "<img src="./images/bbcode/smileys/lol.png" title="lol" alt="lol" />", $texte);
                $texte = str_replace(":triste:", "<img src="./images/bbcode/smileys/triste.png" title="triste" alt="triste" />", $texte);
                $texte = str_replace(":frime:", "<img src="./images/bbcode/smileys/cool.png" title="cool" alt="cool" />", $texte);
                $texte = str_replace(":rire:", "<img src="./images/bbcode/smileys/rire.png" title="rire" alt="rire" />", $texte);
                $texte = str_replace(":s", "<img src="./images/bbcode/smileys/confus.png" title="confus" alt="confus" />", $texte);
                $texte = str_replace(":O", "<img src="./images/bbcode/smileys/choc.png" title="choc" alt="choc" />", $texte);
                $texte = str_replace(":question:", "<img src="./images/bbcode/smileys/question.png" title="?" alt="?" />", $texte);
                $texte = str_replace(":exclamation:", "<img src="./images/bbcode/smileys/exclamation.png" title="!" alt="!" />", $texte);
                $texte = preg_replace("`\[g\](.+)\[/g\]`isU", "<strong>$1</strong>", $texte); 
                $texte = preg_replace("`\[i\](.+)\[/i\]`isU", "<em>$1</em>", $texte);
                $texte = preg_replace("`\[s\](.+)\[/s\]`isU", "<u>$1</u>", $texte);
                $texte = preg_replace("#http://[a-z0-9._/-]+#i", "<a href="$0">$0</a>", $texte);
	return $texte;
    }
    ?>
' >> $name_project/build_in/functions.php
	echo 'Project has been created, time to have fun ;)'

#creation of a new entity to load in the database
elif [ $1 = $entity ]
then
        echo "Creation of a new entity"
c
	echo $name_table
	echo 'Creation of the new table :' "'$name_table'"
		touch $name_project/build_in/entity/$name_table
	echo 'Creating the fields of the table'
	echo "drop table if exists "'$name_table'";
create table "'$name_table'" (
id integer not null primary key auto_increment,
) engine=innodb character set utf8 collate utf8_unicode_ci;
" >> $name_project/build_in/entity/$name_table

#creation of a new module which will fulfill a precise duty
elif [ $1 = $module ]
then
        echo "Creation of a new module"
        name_project=$2
        name_module=$3
	php=".php"
	name_main_module="$name_module""$php"
		mkdir $name_project/$name_module
		mkdir $name_project/$name_module/functions
		mkdir $name_project/$name_module/static
		mkdir $name_project/$name_module/static/img
		mkdir $name_project/$name_module/static/js
		mkdir $name_project/$name_module/static/style
		mkdir $name_project/$name_module/objects
		touch $name_project/$name_module/$name_main_module
		echo "<?php
    session_start();
        ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='fr' />
        <link rel='icon' type='image/ico' href='https://www.w3schools.com/images/w3schools_green.jpg' />
        <link rel='stylesheet' href='style.css' />
        <title>index</title>
    </head>
    <body>
        <div id='bloc_page'>
            <header>
			<?php "'$titre_principal'" = 'titre principal du module';	
			      "'$titre2'" = 'titre secondaire du module';
			 ?>
			<?php require('./build_in/connection.php'); ?>
			<?php require('./build_in/static/required/header.php'); ?>
                </div>           
                <nav>
			<?php require('./build_in/static/required/nav.php'); ?>
                </nav>
            </header>
            <section>
	    </section>
            <footer>
			<?php require('./build_in/static/required/footer.php'); ?>
            </footer>
        </div>
    </body>
</html>
" >> $name_project/index.php

#creation of a new object which will be used by a specific module
elif [ $1 = $object ]
then
        echo "Creation of a new object"
	object=$2
	php=".php"
	name_object="$object""$php"
        name_project=$3
        name_module=$4
		touch $name_project/$name_module/objects/$name_object
		echo "<?php
    class "'$object'"
    {
        private "'$_id'",
        
        //construction
        public function __construct(array "'$donnees'")
        {
            "'$this'"->hydrate("'$donnees'");
        }
        public function hydrate(array "'$donnees'")
        {
            foreach ("'$donnees'" as "'$key'" => "'$value'")
            {
                "'$method = "set".ucfirst($key);
                
                if (method_exists($this, $method))
                {
                    $this->$method($value);
                }
            }
        }
        
        // GETTERS //
        public function id()
        {
            return $this->_id;
        }
       
        //SETTERS 
        public function setId($id)
        {
            $id = (int) $id;
            if ($id > 0)
            {
                $this->_id = $id;
            }
        }
    }
?>
' >> $name_project/$name_module/objects/$name_object
fi
