# burrito_framework

I decided to create my own framework for several reasons

<em>ios and linux only</em>

1) First my current website at that time was quite ugly and I wanted to change it but without having to deploy a heavy stuff</br>
2) I had tried to do it with django framework but the result was not convincing enough for me so I decided to switch to something else</br>
3) I realised thaht I was always doing the same things in my coding and therefore losing lot of time for nothing</br>
4) I wanted to discover bash programming</br>

<strong>I) Creating a new project </strong></br>

open a terminal and enter this command (in the directory where you have the file burrito_framework.sh): <em>./burrito_framework.sh create_project myProjectName</em></br>
This will generate the basic structure of a burrito_framework project
<p>doing so you create a new burrito project and it will result in a basic architecture. "cd" into the folder you created</p></br>
<p>you can see a that a few folders and files were generated: mapping.php where you have to write the path to your different modules, nav.php which will contain the navigation system and index.php which is the landing page of your site. You have the folder erreurs which contains the 404 error page but you can also add yours there. The folder admin is four your admin system.</p></br>
<p>The folder build_in contains the most of your architecture. You hhave the connection to dataase script, cookies management script, mail script and also a function file containing functions you may want to use on the whole site</p></br>
<p>The file static contains other folders for img, form, js, style and required script you want to use on the whole site, if you have customs ones add them there.</p></br>
<p>The entity folder is the one which will contain all your entity creation sql query. Before uploading the script they will be created there.</p></br>

<h2>Entity creation</h2>
<p>To create new entity which will be used by your module, use the command ./burrito_framework.sh new_entity myproject myentity this will create a new sql script with basic code to create your entity. You can then go to the entity folder to add what is missing</p></br>

<h2>Module creation</h2>
<p>Burrito is organised so that every specific action you want to add to your website is done by a specific module. So for each action you have to create one (for instance one for a blog, one for a contact page, one for a reservation page...).</p></br>
<p>The idea behind this is to create a clear architecture for your website and to enable easy reuse of the modules</p></br>
<p>To create new module which will be used by your bundles, use the command ./burrito_framework.sh new_module myproject mymodule this will create a new sql script with basic code to create your module.</p></br>
<p>If you go to your module, you'll see the following file xxx.php which is the interface of your module, where the magic happens. And the folder functions (for specific scripts to your module), objects (which will contain objects for your module) and static which will contain specific images, js and css to your project</p></br>

<h2>Object creation</h2>
<p>Burrito is an object oriented framework. So each module must have is own objects to fulfill a specific task</p></br>
<p>The idea behind this is once again to create a clear architecture for your website and to enable easy reuse of the modules</p></br>
<p>To create new module which will be used by your bundles, use the command ./burrito_framework.sh new_object name_object name_project name_module. This will create a basic architecture to your object that you will have to change according to your needs</p></br>
<p>If you wish to make your object communicate with the database, the best way is to create a new entity for this object.</p></br>


