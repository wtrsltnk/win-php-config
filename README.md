# win-php-config

Cmake is a great tool for c++ developers. It has some nice features which help you automate setting up your development environment. This project uses cmake to setup a working php webserver environment on windows in a few steps.

For this project you need [cmake](https://cmake.org/download/). Make sure the cmake.exe is on the ENV PATH of your command prompt. Test this by running `cmake.exe -h` in the command prompt. 

## Step 1: Download this project
Download this project to your local pc by clicking the "Clone or download" button on the right side of this page. After the download is complete, you extract the zip file.
 
## Step 2: Start a command prompt
[Here](http://pcsupport.about.com/od/commandlinereference/f/open-command-prompt.htm) is how. When the command prompt is open, goto the folder where you extracted the project. You can check if you are in the right folder by running the command `DIR *.txt`. This should return the "CMakeLists.txt" file as a result.

## Step 3: Create temporary build directory
Run the commands `mkdir build && cd build` you create and enter a directory with the name "build". You could rename this if you please.

## Step 4: Run cmake
Run the command `cmake.exe ..\`. This command might take a while depending on the speed of your internet and your machine. When the environment is setup, the phpinfo() page is shown in your browser.

## Step 5: Stop the server
To stop the server, you can hit ctrl+c while in the command prompt. Another way is through browsing to the project folder in windows explorer and run the `stop.bat` file.

That's it. The served info.php can be found in the htdocs of project directory. There you can add more files to serve...

When you want more, try altering the conf-nginx.conf file with the help of the [nginx documentation](http://nginx.org/en/docs/beginners_guide.html). 
