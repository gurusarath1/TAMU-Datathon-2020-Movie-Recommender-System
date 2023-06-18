# Movie-Recommender-system-using-poster

## **Team**
Guru Sarath

Priyanka 

Vaishnavi

Adithiya

## **Mathworks Blog Post**
https://blogs.mathworks.com/student-lounge/2021/01/14/matlab-machine-learning-and-movies-the-perfect-combination/#like

## **DEVPOST**
https://devpost.com/software/movie-recommenders-using-poster-ma64pt

## **Inspiration** 
Last night our team had a movie night and that made us realize how difficult it is to decide on a movie. People say "Don't judge a book by its cover", but a **movie can definitely be judged by its poster**. That's when we thought, how life can be made easier with an app that takes in a favorite movie's poster and recommend similar ones!

##  **What it does**
Upload your favorite movie's poster and get enjoy the recommended similar movie.

## **How we built it**
We extracted a dataset with different genre movie posters from across the internet. We preprocessed the data, reduced dimensions to extract key features, and trained an autoencoder to capture the most important features from the posters. When user inputs poster of their movie of choice, it searches through the database of existing movie vectors and finds closest vectors to the input movie and shows the recommended movie posters. 

## **Challenges we ran into**
This is the first time we are using MATLAB deep learning toolbox and hence it took some time to get comfortable with the toolbox APIs and style. Building the GUI using MATLAB was also new to all of us. Also since it is an unsupervised learning problem, the model had to be validated manually which required extensive training.

## **Accomplishments that we're proud of**
**Autoencoders** have always been fascinating since the time we first learned about it. The very idea of making a model capture the core features by forcing it to learn the input itself was mind-blowing and we have been wanting to implement it from then. Fitting the autoencoder implementation into a problem of our interest and seeing it work was definitely an accomplishment. And having done all of these in a completely new toolbox within a day also added to our accomplishments.

## **What we learned**
At the end of the day, we became comfortable using MATLAB for Machine learning and we also learned how powerful and useful autoencoders are for image retrieval purposes.
## **What's next for Poster based similar movie retrieval** 
Given the short duration, we only trained our model on a limited amount of data. So, there is definitely scope for improvement by including more training data and more regressive preprocessing methods can be implemented over the span of time. If we can come with performance metrics that can accommodate the variation in people's interest, that would be a great milestone.
