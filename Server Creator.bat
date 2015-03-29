@echo off
md Server>nul
cd>nul
cd Server>nul
cls
title BlobmanThingy's Minecraft Server Creator
echo Hello and welcome to Blobman's Server creator.
echo If you would like to start a server please press any key
pause>nul
:mainquestion
set /p serverjar=What type of server would you like? (type B, S, or C) [Type INFO to see information on each] {Do not type any spaces}
if %ERRORLEVEL% 1 goto :ErrorNoSpacesAllowed
if %serverjar%==INFO goto :INFO
if %serverjar%==Cauldron goto :CAULDRON
if %serverjar%==C goto :CAULDRON
if %serverjar%==cauldron goto :CAULDRON
if %serverjar%==CAULDRON goto :CAULDRON
if %serverjar%==Bukkit goto :CRAFTBUKKIT
if %serverjar%==bukkit goto :CRAFTBUKKIT
if %serverjar%==BUKKIT goto :CRAFTBUKKIT
if %serverjar%==B goto :CRAFTBUKKIT
if %serverjar%==Spigot goto :SPIGOT
if %serverjar%==spigot goto :SPIGOT
if %serverjar%==SPIGOT goto :SPIGOT
if %serverjar%==S goto :SPIGOT
if %serverjar%==%serverjar% goto :mainquestion


:INFO
cls
echo [1.8] Bukkit allows for plugins (B)
echo [1.8] Spigot is like bukkit but has performance tweaks (S)
echo [Forge 1.7.10] Cauldron is the only one that is 1.7.10. It allows you to have Forge, and Spigot at the same time. (C)
pause
goto :mainquestion

:CAULDRON
cls
echo 1) You must download a file called CAULDRON.
echo     This file is what makes the server run. 
echo     If you do not have it then you can't have the server. 
echo     Download it and make sure you put it in the "Server" folder
echo     Dont forget to extract the files and put them in the "Server" folder.
echo     Cauldron is the most complicated one of the three. If you don't know what you are doing, then please dont use it
echo     Don't forget to rename cauldron.1.7.10.X.X.X.X.X to Server.jar
echo     Press any button to download the file!
pause>nul
cls
if exist Server.jar goto :2
echo Downloading.....
explorer http://tcpr.ca/files/cauldron/cauldron-1.7.10-1.1307.06.218.zip
echo When you finish downloading the file, press a button to go to the next step
pause>nul
cls
if NOT exist Server.jar goto :errormissingjar
if exist Server.jar goto :2

:CRAFTBUKKIT
cls
echo 1) You must download a file called BUKKIT.
echo     This file is what makes the server run. 
echo     If you do not have it then you can't have the server. 
echo     Download it and make sure you put it in the "Server" folder
echo     Don't forget to name it Server.jar
echo     Press any button to download the file!
pause>nul
cls
if exist Server.jar goto :2
echo Downloading.....
explorer http://tcpr.ca/files/craftbukkit/craftbukkit-1.8-R0.1-SNAPSHOT-latest.jar
echo When you finish downloading the file, press a button to go to the next step
pause>nul
cls
if NOT exist Server.jar goto :errormissingjar
if exist Server.jar goto :2




:SPIGOT
cls
echo 1) You must download a file called SPIGOT.
echo     This file is what makes the server run. 
echo     If you do not have it then you cant have the server. 
echo     Download it and make sure you put it in the "Server" folder
echo     Don't forget to name it Server.jar
echo     Press any button to download the file!
pause>nul
cls
if exist Server.jar goto :2
echo Downloading.....
explorer http://tcpr.ca/files/spigot/spigot-1.8-R0.1-SNAPSHOT-latest.jar
echo When you finish downloading the file, press a button to go to the next step
pause>nul
cls
if NOT exist Server.jar goto :errormissingjar
if exist Server.jar goto :2



:2
cls
echo 2) now we must make a server.properties file.
echo     This file is the settings for the server.
echo     If it gets deleted, the server will just reset it
set /p alreadyhave=Do you already have a "server.properties"? (yes or no)
if %alreadyhave%==no goto :properties
if %alreadyhave%==yes goto :plugins
:properties
pause>nul
cls
set /p nether=Should the nether be allowed? (true or false)
cls
set /p gamemode=What gamemode will your players spawn in? (CREATIVE or SURVIVAL or ADVENTURE or SPECTATOR)
cls
set /p difficulty=What difficulty do you want? (peaceful or easy or normal or hard)
cls
set /p monsters=Can mobs spawn? (true or false)
cls
set /p pvp=Should people be allowed to hit each other? (true or false)
cls
set /p leveltype=What kind of world should this be? (FLAT or DEFAULT or AMPLIFIED or DEBUG)
cls
set /p hardcore=Do you want the server to be in hardcore mode? [Players are banned on death] (true or false)
cls
set /p command=Should command blocks be enabled? (true or false)
cls
set /p max_players=What is the maximum players that will be allowed on your server? (number 1-32767)
cls
set /p port=What port should the server run on? (1-65565)
cls
set /p villagers=Should villagers spawn? (true or false)
cls
set /p fly=Should hackers be allowed to fly? (true or false)
cls
set /p worldname=What name do you want the world to be? (no spaces)
cls
set /p animals=Should animals spawn? (true or false)
cls
set /p whitelist=Do you want the whitelist to be enabled? (true or false)
cls
set /p cracked=Do you want a legal or a cracked server? ("true" is legal and "false" is cracked)
cls
set /p motd=What do you want the MOTD to be? (appears under server name in the server list)
cls
set /p ServerName=What name do you want your server to be?(used in launcher)
cls
set /p RAM=How much RAM do you want to give to the server? (in MB)
cls
echo Press any key to apply settings...
pause>nul
goto :createproperties







:errormissingjar
COLOR 04
echo An error has occured
echo ERROR CODE 806
echo Press any key to exit...
pause>nul
exit


:createproperties
echo #Minecraft server properties>server.properties
echo #>>server.properties
echo allow-nether=%nether%>>server.properties
echo gamemode=%gamemode%>>server.properties
echo difficulty=%difficulty%>>server.properties
echo spawn-monsters=%monsters%>>server.properties
echo pvp=%pvp%>>server.properties
echo snooper-enabled=false>>server.properties
echo level-type=%leveltype%>>server.properties
echo hardcore=%hardcore%>>server.properties
echo enable-command-block=%command%>>server.properties
echo max-players=%max_players%>>server.properties
echo server-port=%port%>>server.properties
echo spawn-npcs=%villagers%>>server.properties
echo allow-flight=%fly%>>server.properties
echo level-name=%worldname%>>server.properties
echo spawn-animals=%animals%>>server.properties
echo white-list=%whitelist%>>server.properties
echo online-mode=%cracked%>>server.properties
echo motd=%motd%>>server.properties
echo Complete!
echo press any key to go to the next step...
pause>nul
echo We are now creating a start.bat file. It will be used to start the server.
echo @echo off>start.bat
echo title %ServerName%>>start.bat
echo java -Xms%RAM%M -Xmx%RAM%M -Xmn128M -server -jar -Xincgc "Server.jar" nogui>>start.bat
echo exit>>start.bat
echo Done!
echo Press any button to go to the next step!
pause>nul

:plugins
md plugins
cls
set /p downloadplugins=Do you want to download any plugins?(yes or no)
if %downloadplugins%==yes goto :essentials
if %downloadplugins%==no goto :doneend
if %downloadplugins%==%downloadplugins% goto :plugins
pause>nul




:essentials
cls
set /p essentials=Do you want to use Essentials? (Basic Plugin) (yes or no)
if %essentials%==yes goto :downloadess
if %essentials%==no goto :doneend
if %essentials%==%essentials% goto :essentials
pause>nul
goto :doneend

:downloadess
echo After you click a button the plugin "essentials" will be downloaded
echo You must save these in the folder called "plugins" which is inside of "Server"
echo This is not an official copy of essentials, as it was made by TeamCity. It can only be used with Spigot 1.8
echo Press any key to start the download...
pause>nul
explorer https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/Essentials/target/Essentials-2.x-SNAPSHOT.jar
explorer https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/EssentialsChat/target/EssentialsChat-2.x-SNAPSHOT.jar
explorer https://hub.spigotmc.org/jenkins/job/Spigot-Essentials/lastSuccessfulBuild/artifact/EssentialsSpawn/target/EssentialsSpawn-2.x-SNAPSHOT.jar
echo Press any key to go to the next step...
pause>nul
goto :WE

:WE
set /p worldedit=Do you want to use WorldEdit and WorldGuard? (yes or no)
if %worldedit%==yes goto :downloadwe
if %worldedit%==no goto :doneend
if %worldedit%==%worldedit% goto :WE
pause>nul

:downloadwe
echo After you press a button, the download of WorldEdit and WorldGuard will begin
echo Please save these files to the "plugins" folder that is inside of "server"
echo Remember to extract WorldGuard from its .zip
pause>nul
explorer http://dev.bukkit.org/media/files/856/297/worldguard-6.0.0-beta-05.zip
explorer http://dev.bukkit.org/media/files/837/363/worldedit-bukkit-6.0.jar
echo press any key to go to the next step
pause>nul
goto :coreprotect

:coreprotect
set /p cp=Do you want to download CoreProtect? It helps prevent griefing!
if %cp%==yes goto :downloadcp
if %cp%==no goto :doneend
if %cp%==%cp% goto :coreprotect
pause>nul

:downloadcp
echo after you click a button, "CoreProtect" will be downloaded
echo dont forget to save it to the "plugins" folder
pause>nul
explorer http://dev.bukkit.org/media/files/820/756/CoreProtect_2.10.0.jar
echo press any key to go to the next step
pause>nul
goto :doneend




:doneend
cls
echo The server making process is now complete.
echo If you would like to start the server then you need to click the "start.bat" in the "Server" folder
echo Don't forget to port forward your internet router, or use Hamachi
echo Good Luck with your server!
echo Press any key to exit...
pause>nul
exit

:ErrorNoSpacesAllowed
COLOR 04
echo An error has occured:
echo ERROR CODE 1
echo press any key to exit
pause>nul
exit
