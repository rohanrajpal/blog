# Defines https://hub.docker.com/repository/docker/hamelsmu/fastpages-jekyll
<<<<<<< HEAD
# FROM jekyll/jekyll:4.0.0 THIS IS BROKEN RIGHT NOW 
FROM hamelsmu/fastpages-jekyll
=======
FROM jekyll/jekyll:4.0.1
# FROM hamelsmu/fastpages-jekyll
>>>>>>> template/master

COPY . .

# Pre-load all gems into the environment
RUN chmod -R 777 .
RUN gem install bundler 
<<<<<<< HEAD
RUN jekyll build
=======
RUN jekyll build
>>>>>>> template/master
