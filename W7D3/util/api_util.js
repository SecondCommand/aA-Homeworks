/*Let's write a function fetchSearchGiphys in api_util.js to make an
AJAX call to the Giphy API. It will take a single argument, the searchTerm 
entered by a user. You can check out the Giphy API docs for more details,
but in short, we want to make a GET request to
http://api.giphy.com/v1/gifs/search?q=${search+term}&api_key=dc6zaTOxFJmzC&limit=2 
where the ${search-term} is replaced with our actual query. 
We tag limit=2 onto the end of our query params to tell Giphy we only want two GIFs back.
The giphy API is relatively slow, so keeping the response size down helps our app be a little faster.

Remember, it's best to test small pieces as we go.
 Let's test out that AJAX request to make sure it's doing what we're intending.

You should have already run webpack - w.
Check to make sure our bundle.js file is getting updated.
It has already been sourced for you in index.html.

Open the index.html file in the browser.
The jQuery script tag has already been added, so $.ajax should already be defined.
Import fetchSearchGiphys to the entry file, 
then go ahead and put it on the window so we have access to it in the console.

Try running this test code:

fetchSearchGiphys("puppies").then((res) => console.log(res.data));

This will make the AJAX request, which will return a promise.
We chain on a then to log the response data once the response comes back.
We should see an array of two objects.Those are our giphys! 
Make sure you get this working before moving on, and don't forget to remove fetchSearchGiphys 
from the window once you're done testing.

*/

export const fetchSearchGiphys = searchTerm => {
    return $.ajax({
        method: 'GET',
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`
    })
};

