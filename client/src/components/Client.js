
/* eslint-disable no-undef */
function getTopics(cb) {
  return fetch('api/topics', {
    accept: "application/json"
  })
    .then(checkStatus)
    .then(parseJSON)
    .then(cb);
}

function getTweets(topicSlug, cb) {
  return fetch(`api/tweets/${topicSlug}`, {
    accept: "application/json"
  })
    .then(checkStatus)
    .then(parseJSON)
    .then(cb);
}

function postTweet(text, cb) {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  return fetch(`api/tweets/tweet`, {
    accept: "application/json",
    headers: headers,
    method: 'post',
    body: JSON.stringify({text: text})
  })
    .then(checkStatus)
    .then(parseJSON)
    .then(cb);
}

function checkStatus(response) {
  if (response.status >= 200 && response.status < 300) {
    return response;
  }
  const error = new Error(`HTTP Error ${response.statusText}`);
  error.status = response.statusText;
  error.response = response;
  console.log(error); // eslint-disable-line no-console
  throw error;
}

function parseJSON(response) {
  return response.json();
}

const Client = { getTopics, getTweets, postTweet };
export default Client;
