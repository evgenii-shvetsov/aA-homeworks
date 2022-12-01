# Your First AJAX Request

In this practice, you will implement the AJAX pattern by using JavaScript via
the [`Fetch API`][fetch-api] to asynchronously send an HTTP request and handle
its JSON response. You will use the free public
[`OpenWeatherMap`][open-weather-api] API as your backend server.

## Setup

Click the `Download Project` button at the bottom of this page to go to the
starter repo. Clone the repo, then load __index.html__ in a browser.

Open the console. You should see a welcome message!

## Sending an AJAX Request

In __index.js__, write an AJAX request to get the weather for London using the
[`fetch`] method and log the JSON data you get back from the server. Some
guidelines:

- It should make a `GET` request to the following URL:
  `https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b`
  - This request hits the `weather` endpoint (i.e., route) of the
    `OpenWeatherMap` API, version `2.5`.
  - The URL contains 2 query string parameters: a query (`q`) of `London,UK`
    and an API key (`appid`) of `bcb83c4b54aee8418983c2aff3073b3b`.
  - **Note:** If you get an error about an `Invalid API key`, try signing up for
    your own API key [here][weather-api-signup] and using that as the `appid`.
- Invoke `then` on the result of your `fetch` call. Supply a success callback,
  which will receive a [`Response`] object as its argument.
  - If the `Response` was successful (use the `ok` property to check), parse its
    body as JSON using the [`json`] method and return the resulting Promise.
    Your call to `then` will now resolve when this returned Promise resolves,
    with the parsed response data.
  - If the `Response` was not `ok`, throw an `Error` containing the `Response`
    object. This `Response` will then be passed to the next failure callback in
    your `then` chain.
- Chain an additional call to `then` to handle the parsed data. Supply both a
  success and a failure callback. `console.log` a message of `"Success!"` and
  the parsed data in the success callback, and a message of `"Failure!"` and the
  error argument in the failure callback.
  - **Note:** Since you didn't supply a failure callback to your first `then`
    call, this failure callback will handle failures from either your `fetch`
    Promise or your `json` Promise.
- Write another `console.log` at the bottom of the file (i.e., outside of the
  `then` chain) saying `"The AJAX request has been dispatched."`.
  
Your file should have this rough structure:

```js
console.log("Hello from the console!");

fetch(/* request to OpenWeatherMap */)
  .then(/* in success callback, process response as JSON */)
  .then(
    // log success message and parsed data in success callback
    // log failure message and error argument in failure callback
  );

console.log("The AJAX request has been dispatched.");
```

Notice the order n which the `console.log`s run.

Make sure you can answer the following questions:

1. When does the request get sent?
2. When does the response come back?
3. What's the current weather in London?
4. Did the page refresh?
5. How could you use a different HTTP method in your request?

[open-weather-api]: https://openweathermap.org/current
[fetch-api]: https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API
[`fetch`]: https://developer.mozilla.org/en-US/docs/Web/API/fetch
[weather-api-signup]: https://home.openweathermap.org/users/sign_up
[`Response`]: https://developer.mozilla.org/en-US/docs/Web/API/Response
[`json`]: https://developer.mozilla.org/en-US/docs/Web/API/Response/json